//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var presentAlert: Bool = false
    @Published var alertMessage = ""
    @Published var showMoviesView: Bool = false
    var requestToken: AuthenticationTokenResponseModel?

    func getRequestToken() async throws {
        requestToken = try await NetworkService.shared.request(with: RequestObject(
            url: LoginEndpoints.authenticationToken.path
            ),
            responseModel: AuthenticationTokenResponseModel.self)
    }

    func login() async {
        do {
            if isTokenExpired() {
                try await getRequestToken()
            }

            let validation =  try await validateUser()
            guard validation.success ?? false else {
                throw NetworkError.customError(0, "Unknown error!")
            }

            let session = try await createSession()
            guard session.success ?? false, let sessionId = session.sessionId else {
                throw NetworkError.customError(0, "Unknown error!")
            }

            if saveSessionId(with: sessionId) {
                showMoviesView = true
            }
        } catch {
            guard let error = error as? NetworkError, let message = error.response?.message else {
                alertMessage = "Unknown error!"
                presentAlert = true
                return
            }
            alertMessage = message
            presentAlert = true
        }
    }

    private func isTokenExpired() -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"

        guard let requestToken,
              let expiresAt = requestToken.expiresAt,
              let date = dateFormatter.date(from: expiresAt),
              date > .now else {
            return true
        }
        return false
    }

    private func validateUser() async throws -> LoginResponseModel {
        let requestModel = LoginRequestModel(username: username, password: password, requestToken: requestToken?.requestToken ?? "")
        return try await NetworkService.shared.request(with: RequestObject(
            url: LoginEndpoints.loginWithToken.path,
            method: .post,
            body: requestModel
            ),
            responseModel: LoginResponseModel.self
        )
    }

    private func createSession() async throws -> SessionResponseModel {
        let requestModel = SessionRequestModel(requestToken: requestToken?.requestToken ?? "")
        return try await NetworkService.shared.request(with: RequestObject(
            url: LoginEndpoints.createSession.path,
            method: .post,
            body: requestModel
            ),
            responseModel: SessionResponseModel.self)
    }

    private func saveSessionId(with sessionId: String) -> Bool {
        KeychainManager.shared.save(key: "SessionID", value: sessionId)
    }
}

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
    var requestToken: AuthenticationTokenResponseModel?

    func getRequestToken() async throws {
        requestToken = try await NetworkService.shared.request(endpoint: LoginEndpoints.authenticationToken, responseModel: AuthenticationTokenResponseModel.self)
    }

    func login() async {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"

        do {
            guard let requestToken,
                  let expiresAt = requestToken.expiresAt,
                  let date = dateFormatter.date(from: expiresAt),
                  date > .now else {
                try await getRequestToken()
                return
            }

            let validation = try await NetworkService.shared.request(
                endpoint: LoginEndpoints.loginWithToken(
                    username: username,
                    password: password,
                    token: requestToken.requestToken ?? ""
                ),
                responseModel: LoginResponseModel.self)

            if validation.success ?? false {
                let session = try await NetworkService.shared.request(
                    endpoint: LoginEndpoints.createSession(
                        requestToken: requestToken.requestToken ?? ""
                    ), responseModel: SessionResponseModel.self)
                if session.success ?? false {
                    print(session.sessionId)
                }
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
}

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
    var requestToken: AuthenticationTokenResponseModel?

    func getRequestToken() async {
        do {
            requestToken = try await NetworkService.shared.request(endpoint: LoginEndpoints.authenticationToken, responseModel: AuthenticationTokenResponseModel.self)
        } catch {
            requestToken = nil
        }
    }

    func login() async throws {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"

        guard let requestToken,
              let expiresAt = requestToken.expiresAt,
              let date = dateFormatter.date(from: expiresAt),
              date > .now else {
            await getRequestToken()
            throw NetworkError.customError(0, "Oops! Your login session has expired. Please try again!")
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
    }
}

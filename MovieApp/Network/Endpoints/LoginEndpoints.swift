//
//  LoginEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum LoginEndpoints: EndpointProtocol {
    case authenticationToken
    case loginWithToken(username: String, password: String, token: String)
    case createSession(requestToken: String)

    var path: String {
        switch self {
            case .authenticationToken:
            return (Configuration.baseURL ?? "") + "authentication/token/new"
            case .loginWithToken:
            return (Configuration.baseURL ?? "") + "authentication/token/validate_with_login"
            case .createSession:
            return (Configuration.baseURL ?? "") + "authentication/session/new"
        }
    }

    func createObjectRequest() -> RequestObject {
        switch self {
            case .authenticationToken:
                return RequestObject(url: self.path)
            case .loginWithToken(let username, let password, let token):
                let requestModel = LoginRequestModel(username: username, password: password, requestToken: token)
                let data = try? JSONEncoder().encode(requestModel)
                return RequestObject(url: self.path, method: .post, body: data)
            case .createSession(let requestToken):
                let requestModel = SessionRequestModel(requestToken: requestToken)
                let data = try? JSONEncoder().encode(requestModel)
                return RequestObject(url: self.path, method: .post, body: data)
        }
    }
}

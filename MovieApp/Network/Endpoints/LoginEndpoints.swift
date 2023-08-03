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
    case loginWithToken
    case createSession

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
}

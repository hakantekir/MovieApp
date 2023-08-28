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
                return URLManager.base(path: "authentication/token/new").url
            case .loginWithToken:
                return URLManager.base(path: "authentication/token/validate_with_login").url
            case .createSession:
                return URLManager.base(path: "authentication/session/new").url
        }
    }
}

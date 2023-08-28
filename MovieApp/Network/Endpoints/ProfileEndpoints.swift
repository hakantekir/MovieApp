//
//  ProfileEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 16.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum ProfileEndpoints: EndpointProtocol {
    case details(sessionId: String)
    case deleteSession

    var path: String {
        switch self {
            case .details(let sessionId):
                return URLManager.base(path: "account/session_id=\(sessionId)").url
            case .deleteSession:
                return URLManager.base(path: "authentication/session").url
        }
    }
}

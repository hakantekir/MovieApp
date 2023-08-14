//
//  MovieDetailsEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum MovieDetailsEndpoints: EndpointProtocol {
    case details(movieID: Int)
    case credits(movieID: Int)

    var path: String {
        switch self {
            case .details(let movieID):
                return (Configuration.baseURL ?? "") + "/movie/" + String(movieID)
            case .credits(let movieID):
                return (Configuration.baseURL ?? "") + "/movie/" + String(movieID) + "/credits"
        }
    }
}

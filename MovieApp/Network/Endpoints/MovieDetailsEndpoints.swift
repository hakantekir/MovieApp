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
                return URLManager.base(path: "movie/\(movieID)").url
            case .credits(let movieID):
                return URLManager.base(path: "movie/\(movieID)/credits").url
        }
    }
}

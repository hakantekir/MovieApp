//
//  TvDetailsEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum TvDetailsEndpoints: EndpointProtocol {
    case details(tvID: Int)
    case credits(tvID: Int)

    var path: String {
        switch self {
            case .details(let tvID):
                return (Configuration.baseURL ?? "") + "tv/" + String(tvID)
            case .credits(let tvID):
                return (Configuration.baseURL ?? "") + "tv/" + String(tvID) + "/credits"
        }
    }
}

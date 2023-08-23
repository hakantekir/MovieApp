//
//  SearchEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum SearchEndpoints: EndpointProtocol {
    case multi(query: String)
    case movieCast(movieID: Int)
    case tvCast(tvID: Int)
    case actorDetails(actorID: Int)

    var path: String {
        switch self {
            case .multi(let query):
                return ((Configuration.baseURL ?? "") + "search/multi?query=" + query).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            case .movieCast(let movieID):
                return (Configuration.baseURL ?? "") + "movie/" + String(movieID) + "/credits"
            case .tvCast(let tvID):
                return (Configuration.baseURL ?? "") + "tv/" + String(tvID) + "/credits"
            case .actorDetails(let actorID):
                return (Configuration.baseURL ?? "") + "person/" + String(actorID)
        }
    }
}

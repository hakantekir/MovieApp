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
                return URLManager.base(path: "search/multi?query=\(query)").url
                    .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            case .movieCast(let movieID):
                return URLManager.base(path: "movie/\(movieID)/credits").url
            case .tvCast(let tvID):
                return URLManager.base(path: "tv/\(tvID)/credits").url
            case .actorDetails(let actorID):
                return URLManager.base(path: "person/\(actorID)").url
        }
    }
}

//
//  TvEndpoints.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum TvEndpoints: EndpointProtocol {
    case popular
    case topRated
    case genres
    case tvDetails(tvID: Int)
    var path: String {
        switch self {
            case .popular:
                return URLManager.base(path: "tv/popular").url
            case .topRated:
                return URLManager.base(path: "tv/top_rated").url
            case .genres:
                return URLManager.base(path: "genre/tv/list").url
            case .tvDetails(let tvID):
                return URLManager.base(path: "tv/\(tvID)").url
        }
    }
}

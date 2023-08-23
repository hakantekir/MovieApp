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
                return (Configuration.baseURL ?? "") + "tv/popular"
            case .topRated:
                return (Configuration.baseURL ?? "") + "tv/top_rated"
            case .genres:
                return (Configuration.baseURL ?? "") + "genre/tv/list"
            case .tvDetails(let tvID):
                return (Configuration.baseURL ?? "") + "tv/" + String(tvID)
        }
    }
}

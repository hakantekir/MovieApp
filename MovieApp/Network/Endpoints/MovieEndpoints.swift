//
//  MovieEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum MovieEndpoints: EndpointProtocol {
    case nowPlaying
    case popular
    case genres
    case movieDetails(movieID: Int)

    var path: String {
        switch self {
            case .nowPlaying:
                return (Configuration.baseURL ?? "") + "movie/now_playing"
            case .popular:
                return (Configuration.baseURL ?? "") + "movie/popular"
            case .genres:
                return (Configuration.baseURL ?? "") + "genre/movie/list"
            case .movieDetails(let movieID):
                return (Configuration.baseURL ?? "") + "movie/" + String(movieID)
        }
    }
}

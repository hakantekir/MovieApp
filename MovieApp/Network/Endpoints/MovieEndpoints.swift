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
                return URLManager.base(path: "movie/now_playing").url
            case .popular:
                return URLManager.base(path: "movie/popular").url
            case .genres:
                return URLManager.base(path: "genre/movie/list").url
            case .movieDetails(let movieID):
                return URLManager.base(path: "movie/\(movieID)").url
        }
    }
}

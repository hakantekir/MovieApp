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
                return (Configuration.baseURL ?? "") + "/genre/movie/list"
            case .movieDetails:
                return (Configuration.baseURL ?? "") + "/movie/"
        }
    }

    func createObjectRequest() -> RequestObject {
        switch self {
            case .movieDetails(let movieID):
                return RequestObject(url: self.path + String(movieID))
            default:
                return RequestObject(url: self.path)
        }
    }
}

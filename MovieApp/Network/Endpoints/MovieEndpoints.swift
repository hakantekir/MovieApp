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
    case image(filePath: String)

    var path: String {
        switch self {
            case .nowPlaying:
                return (Configuration.baseURL ?? "") + "movie/now_playing"
            case .popular:
                return (Configuration.baseURL ?? "") + "movie/popular"
            case .genres:
                return (Configuration.baseURL ?? "") + "/genre/movie/list"
            case .image:
                return (Configuration.imageURL ?? "")
        }
    }

    func createObjectRequest() -> RequestObject {
        switch self {
            case .image(let filePath):
                return RequestObject(url: self.path + filePath)
            default:
                return RequestObject(url: self.path)
        }
    }
}

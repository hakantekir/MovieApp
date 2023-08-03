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
                return (Configuration.baseURL ?? "") + "movie/now_playing" + LocaleEndpoint.deviceLanguage.path
            case .popular:
                return (Configuration.baseURL ?? "") + "movie/popular" + LocaleEndpoint.deviceLanguage.path
            case .genres:
                return (Configuration.baseURL ?? "") + "/genre/movie/list" + LocaleEndpoint.deviceLanguage.path
            case .movieDetails:
                return (Configuration.baseURL ?? "") + "/movie/"
        }
    }

    func createObjectRequest() -> RequestObject {
        switch self {
            case .movieDetails(let movieID):
                return RequestObject(url: self.path + String(movieID) + LocaleEndpoint.deviceLanguage.path)
            default:
                return RequestObject(url: self.path)
        }
    }
}

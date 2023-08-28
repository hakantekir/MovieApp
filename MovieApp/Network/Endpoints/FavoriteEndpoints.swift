//
//  FavoriteEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 23.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum FavoriteEndpoints: EndpointProtocol {
    case updateFavorite(sessionId: String)
    case movies(sessionId: String)
    case series(sessionId: String)
    case movieState(sessionId: String, movieId: Int)
    case seriesState(sessionId: String, seriesId: Int)
    case addMovieRating(sessionId: String, movieId: Int)
    case addSeriesRating(sessionId: String, seriesID: Int)

    var path: String {
        switch self {
            case .updateFavorite(let sessionId):
                return URLManager.base(path: "account/id/favorite?session_id=\(sessionId)").url
            case .movies(let sessionId):
                return URLManager.base(path: "account/id/favorite/movies?session_id=\(sessionId)").url
            case .series(let sessionId):
                return URLManager.base(path: "account/id/favorite/movies?session_id=\(sessionId)").url
            case .movieState(let sessionId, let movieId):
                return URLManager.base(path: "movie/\(movieId)/account_states?session_id=\(sessionId)").url
            case .seriesState(let sessionId, let seriesId):
                return URLManager.base(path: "tv/\(seriesId)/account_states?session_id=\(sessionId)").url
            case .addMovieRating(let sessionId, let movieId):
                return URLManager.base(path: "movie/\(movieId)/rating?session_id=\(sessionId)").url
            case .addSeriesRating(let sessionId, let seriesID):
                return URLManager.base(path: "tv/\(seriesID)/rating?session_id=\(sessionId)").url
        }
    }
}

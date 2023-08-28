//
//  FavoriteManager.swift
//  MovieApp
//
//  Created by Hakan Tekir on 23.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class FavoriteManager {
    static let shared = FavoriteManager()

    func addFavorite(type: MediaType, id: Int) async throws -> UpdateFavoriteResponseModel {
        let body = MediaFavoriteRequestModel(type: type.rawValue, id: id, favorite: true)
        let sessionId = try getSessionId()
        let response = try await NetworkService.shared.request(
            with: RequestObject(url: FavoriteEndpoints.updateFavorite(sessionId: sessionId).path, method: .post, body: body),
            responseModel: UpdateFavoriteResponseModel.self
        )
        return response
    }

    func removeFavorite(type: MediaType, id: Int) async throws -> UpdateFavoriteResponseModel {
        let body = MediaFavoriteRequestModel(type: type.rawValue, id: id, favorite: false)
        let sessionId = try getSessionId()
        let response = try await NetworkService.shared.request(
            with: RequestObject(url: FavoriteEndpoints.updateFavorite(sessionId: sessionId).path, method: .post, body: body),
            responseModel: UpdateFavoriteResponseModel.self
        )
        return response
    }

    func addRating(type: MediaType, id: Int, rating: Double) async throws -> UpdateFavoriteResponseModel {
        let body = ["value": rating]
        let sessionId = try getSessionId()
        switch type {
            case .movie:
                return try await NetworkService.shared.request(
                    with: RequestObject(url: FavoriteEndpoints.addMovieRating(sessionId: sessionId, movieId: id).path, method: .post, body: body),
                    responseModel: UpdateFavoriteResponseModel.self
                )
            case .tvSeries:
                return try await NetworkService.shared.request(
                    with: RequestObject(url: FavoriteEndpoints.addSeriesRating(sessionId: sessionId, seriesID: id).path, method: .post, body: body),
                    responseModel: UpdateFavoriteResponseModel.self
                )
            case .person:
                throw NetworkError.customError(0, "Wrong type")
        }
    }

    func mediaState(type: MediaType, id: Int) async throws -> MediaStateResponseModel {
        let sessionId = try getSessionId()
        switch type {
            case .movie:
                return try await NetworkService.shared.request(
                    with: RequestObject(url: FavoriteEndpoints.movieState(sessionId: sessionId, movieId: id).path),
                    responseModel: MediaStateResponseModel.self)
            case .tvSeries:
                return try await NetworkService.shared.request(
                    with: RequestObject(url: FavoriteEndpoints.seriesState(sessionId: sessionId, seriesId: id).path),
                    responseModel: MediaStateResponseModel.self)
            case .person:
                throw NetworkError.customError(0, "Wrong type")
        }
    }

    func favoriteMovies() async throws -> FavoriteMoviesResponseModel {
        let sessionId = try getSessionId()
        let response = try await NetworkService.shared.request(
            with: RequestObject(url: FavoriteEndpoints.movies(sessionId: sessionId).path),
            responseModel: FavoriteMoviesResponseModel.self
        )
        return response
    }

    func favoriteSeries() async throws -> FavoriteSeriesResponseModel {
        let sessionId = try getSessionId()
        let response = try await NetworkService.shared.request(
            with: RequestObject(url: FavoriteEndpoints.series(sessionId: sessionId).path),
            responseModel: FavoriteSeriesResponseModel.self
        )
        return response
    }

    private func getSessionId() throws -> String {
        guard let id = KeychainManager.shared.load(key: "SessionID") else {
            throw NetworkError.customError(0, "Unauthorized")
        }
        return id
    }
}

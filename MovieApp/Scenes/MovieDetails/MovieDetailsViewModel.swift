//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class MovieDetailsViewModel: ObservableObject {
    let id: Int
    @Published var movieDetails: MovieDetailsModel?
    @Published var cast: ActorsResponseModel?
    @Published var movieState: MediaStateResponseModel?
    @Published var rating: Double = 0

    init(id: Int) {
        self.id = id
    }

    func fetchMovieDetails() async {
        movieDetails = try? await NetworkService.shared.request(with: RequestObject(
            url: MovieDetailsEndpoints.details(movieID: id).path),
                                                                responseModel: MovieDetailsModel.self
        )
    }

    func fetchCredits() async {
        cast = try? await NetworkService.shared.request(with: RequestObject(
            url: MovieDetailsEndpoints.credits(movieID: id).path),
                                                        responseModel: ActorsResponseModel.self
        )
    }

    func fetchMovieState() async {
        movieState = try? await FavoriteManager.shared.mediaState(type: .movie, id: id)
        if let rating = movieState?.rating {
            self.rating = rating / 2
        }
    }

    func updateFavorite() async {
        if movieState?.favorite == true {
            let response = try? await FavoriteManager.shared.removeFavorite(type: .movie, id: id)
            if response?.success == true {
                movieState?.favorite = false
            }
        } else {
            let response = try? await FavoriteManager.shared.addFavorite(type: .movie, id: id)
            if response?.success == true {
                movieState?.favorite = true
            }
        }
    }

    func updateRating(rating: Double) async {
        let response = try? await FavoriteManager.shared.addRating(type: .movie, id: id, rating: Double(rating * 2))
        movieState?.rating = rating * 2
        if response?.success == true {
            self.rating = rating
        }
    }
}

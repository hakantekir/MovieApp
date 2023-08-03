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
    @Published var movieDetails: MovieDetailsModel?

    func fetchMovieDetails(movieId: Int) async {
        movieDetails = try? await NetworkService.shared.request(with: RequestObject(url: MovieEndpoints.movieDetails(movieID: movieId).path), responseModel: MovieDetailsModel.self)
    }
}

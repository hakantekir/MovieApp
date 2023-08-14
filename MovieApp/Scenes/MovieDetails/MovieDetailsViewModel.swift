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
}

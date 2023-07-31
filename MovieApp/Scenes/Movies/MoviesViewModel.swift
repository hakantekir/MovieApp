//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject {
    @Published var nowPlayingMovies: NowPlayingMoviesModel?
    @Published var popularMovies: PopularMoviesModel?

    func fetchNowPlayingMovies() async {
        nowPlayingMovies = try? await NetworkService.shared.request(endpoint: MovieEndpoints.nowPlaying, responseModel: NowPlayingMoviesModel.self)
    }

    func fetchPopularMovies() async {
        popularMovies = try? await NetworkService.shared.request(endpoint: MovieEndpoints.popular, responseModel: PopularMoviesModel.self)
    }

    func fetchMovieGenres() async {
        let genresResponse = try? await NetworkService.shared.request(endpoint: MovieEndpoints.genres, responseModel: MovieGenresModel.self)
        MovieModel.genres = genresResponse?.genres
    }
}

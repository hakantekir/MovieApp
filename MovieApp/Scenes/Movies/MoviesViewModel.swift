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
        nowPlayingMovies = try? await NetworkService.shared.request(with: RequestObject(url: MovieEndpoints.nowPlaying.path), responseModel: NowPlayingMoviesModel.self)
    }

    func fetchPopularMovies() async {
        popularMovies = try? await NetworkService.shared.request(with: RequestObject(url: MovieEndpoints.popular.path), responseModel: PopularMoviesModel.self)
    }

    func fetchMovieGenres() async {
        let genresResponse = try? await NetworkService.shared.request(with: RequestObject(url: MovieEndpoints.genres.path), responseModel: MovieGenresModel.self)
        MovieModel.genres = genresResponse?.genres
    }
}

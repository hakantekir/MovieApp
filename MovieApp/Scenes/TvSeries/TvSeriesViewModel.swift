//
//  TVSeriesViewModel.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class TvSeriesViewModel: ObservableObject {
    @Published var popularTvSeries: PopularTvModel?
    @Published var topRatedTvSeries: TopRatedTvModel?

    func fetchPopularTvSeries() async {
        popularTvSeries = try? await NetworkService.shared.request(with: RequestObject(url: TvEndpoints.popular.path), responseModel: PopularTvModel.self)
    }

    func fetchTopRatedTvSeries() async {
        topRatedTvSeries = try? await NetworkService.shared.request(with: RequestObject(url: TvEndpoints.topRated.path), responseModel: TopRatedTvModel.self)
    }

    func fetchTvGenres() async {
        let genresResponse = try? await NetworkService.shared.request(with: RequestObject(url: TvEndpoints.genres.path), responseModel: TvGenresModel.self)
        TvModel.genres = genresResponse?.genres
    }
}

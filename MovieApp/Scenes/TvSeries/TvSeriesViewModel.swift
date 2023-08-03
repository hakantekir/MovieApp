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
        popularTvSeries = try? await NetworkService.shared.request(endpoint: TvEndpoints.popular, responseModel: PopularTvModel.self)
    }

    func fetchTopRatedTvSeries() async {
        topRatedTvSeries = try? await NetworkService.shared.request(endpoint: TvEndpoints.topRated, responseModel: TopRatedTvModel.self)
    }

    func fetchTvGenres() async {
        let genresResponse = try? await NetworkService.shared.request(endpoint: TvEndpoints.genres, responseModel: TvGenresModel.self)
        TvModel.genres = genresResponse?.genres
    }
}

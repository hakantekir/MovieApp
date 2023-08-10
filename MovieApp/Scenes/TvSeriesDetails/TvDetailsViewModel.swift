//
//  TvDetailsViewModel.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class TvDetailsViewModel: ObservableObject {
    @Published var tvSeriesDetails: TvDetailsModel?
    @Published var cast: ActorsResponseModel?
    private let tvSeriesID: Int

    init(tvSeriesID: Int) {
        self.tvSeriesID = tvSeriesID
    }

    func fetchTvSeriesDetails() async {
        tvSeriesDetails = try? await NetworkService.shared.request(with: RequestObject(
            url: TvDetailsEndpoints.details(tvID: tvSeriesID).path),
                                                                   responseModel: TvDetailsModel.self
        )
    }

    func fetchCredits() async {
        cast = try? await NetworkService.shared.request(with: RequestObject(
            url: TvDetailsEndpoints.credits(tvID: tvSeriesID).path),
                                                        responseModel: ActorsResponseModel.self
        )
    }
}

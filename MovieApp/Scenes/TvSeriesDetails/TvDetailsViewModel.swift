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
    private let tvSeriesID: Int
    init(tvSeriesID: Int) {
        self.tvSeriesID = tvSeriesID
    }
    func fetchTvSeriesDetails() async {
        tvSeriesDetails = try? await NetworkService.shared.request(endpoint: TvEndpoints.tvDetails(tvID: tvSeriesID), responseModel: TvDetailsModel.self)
    }
}

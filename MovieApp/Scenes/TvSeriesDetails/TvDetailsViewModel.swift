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
    @Published var tvSeriesState: MediaStateResponseModel?
    @Published var rating: Double = 0.0
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

    func fetchTvSeriesState() async {
        tvSeriesState = try? await FavoriteManager.shared.mediaState(type: .tvSeries, id: tvSeriesID)
        if let rating = tvSeriesState?.rating {
            self.rating = rating / 2
        }
    }

    func updateFavorite() async {
        if tvSeriesState?.favorite == true {
            let response = try? await FavoriteManager.shared.removeFavorite(type: .tvSeries, id: tvSeriesID)
            if response?.success == true {
                tvSeriesState?.favorite = false
            }
        } else {
            let response = try? await FavoriteManager.shared.addFavorite(type: .tvSeries, id: tvSeriesID)
            if response?.success == true {
                tvSeriesState?.favorite = true
            }
        }
    }

    func updateRating(rating: Double) async {
        let response = try? await FavoriteManager.shared.addRating(type: .tvSeries, id: tvSeriesID, rating: Double(rating * 2))
        tvSeriesState?.rating = rating * 2
        if response?.success == true {
            self.rating = rating
        }
    }
}

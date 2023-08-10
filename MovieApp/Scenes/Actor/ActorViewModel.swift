//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class ActorViewModel: ObservableObject {
    let actorID: Int
    @Published var actorDetails: ActorDetailsResponseModel?
    @Published var credits: [ActorMediaDataModel]?
    private let dateFormatter: DateFormatter

    init(actorID: Int) {
        self.actorID = actorID
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }

    func fetchDetails() async {
        actorDetails = try? await NetworkService.shared.request(
            with: RequestObject(url: ActorEndpoints.actorDetails(actorID: actorID).path),
            responseModel: ActorDetailsResponseModel.self)
    }

    func fetchMedias() async {
        async let tvCredits = getTvCredits()
        async let movieCredits = getMovieCredits()

        await credits = mapMovieCredits(movieCredits) + mapTvCredits(tvCredits)
    }

    private func getMovieCredits() async -> ActorMovieCreditsResponseModel? {
        try? await NetworkService.shared.request(with: RequestObject(url: ActorEndpoints.movies(actorID: actorID).path), responseModel: ActorMovieCreditsResponseModel.self)
    }

    private func getTvCredits() async -> ActorTvCreditsResponseModel? {
        try? await NetworkService.shared.request(with: RequestObject(url: ActorEndpoints.series(actorID: actorID).path), responseModel: ActorTvCreditsResponseModel.self)
    }

    private func mapMovieCredits(_ movieCredits: ActorMovieCreditsResponseModel?) -> [ActorMediaDataModel] {
        guard let movieCredits, let movieCast = movieCredits.cast else {
            return []
        }

        let mappedMovieCredits = movieCast.map { movie in
            ActorMediaDataModel(type: .movie,
                                id: movie.id,
                                title: movie.title,
                                path: movie.posterPath,
                                localizedReleaseDate: dateFormatter.string(from: movie.releaseDate ?? .now),
                                voteAverage: movie.voteAverage)
        }

        return mappedMovieCredits
    }

    private func mapTvCredits(_ tvCredits: ActorTvCreditsResponseModel?) -> [ActorMediaDataModel] {
        guard let tvCredits, let tvCast = tvCredits.cast else {
            return []
        }

        let mappedTvCredits = tvCast.map { tvSeries in
            ActorMediaDataModel(type: .tvSeries,
                                id: tvSeries.id,
                                title: tvSeries.name,
                                path: tvSeries.posterPath,
                                localizedReleaseDate: DateFormatter.localizedDateFormatter.string(from: tvSeries.firstAirDate ?? .now),
                                voteAverage: tvSeries.voteAverage)
        }

        return mappedTvCredits
    }
}

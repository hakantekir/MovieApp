//
//  TvDetailsModel.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvDetailsModel: Decodable {
    let genres: [Genre]?
    let id: Int?
    let name: String?
    let voteAverage: Double?
    let numberOfSeasons: Int?
    let numberOfEpisodes: Int?
    let overview: String?
    let posterPath: String?
    let firstAirDate: Date?
    let lastAirDate: Date?
    let episodeRuntime: [Int]?
    enum CodingKeys: String, CodingKey {
        case genres
        case id
        case name
        case voteAverage = "vote_average"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case lastAirDate = "last_air_date"
        case episodeRuntime = "episode_run_time"
    }
    var genresText: String {
        let firstThreeGenres = genres?.prefix(3).map { $0 } ?? []
        return firstThreeGenres.map { $0.name ?? "" }.joined(separator: ", ")
    }
    var runtimeText: String {
        let runtime = episodeRuntime?.first ?? 0
        return String(format: "%d %@", runtime, L10n.tvSeriesDetailsDuration)
    }
    var seasonsText: String {
        let seasons = numberOfSeasons ?? 0
        return String(format: "%d %@", seasons, L10n.tvSeriesDetailsSeasons)
    }
    var firstAndLastAirDateText: String {
        let first = DateFormatter.onlyYearFormatter.string(from: firstAirDate ?? Date())
        let last = DateFormatter.onlyYearFormatter.string(from: lastAirDate ?? Date())
        return String(format: "%@ (%@ - %@)", L10n.tvSeriesDetailsTvSeries, first, last)
    }
}

//
//  ActorTvCreditsResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ActorTvCreditsResponseModel: Decodable {
    let cast: [TvCast]?
    let crew: [TvCrew]?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case cast
        case crew
        case id
    }
}

struct TvCast: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate: Date?
    let name: String?
    let voteAverage: Double?
    let voteCount: Int?
    let character: String?
    let creditID: String?
    let episodeCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name = "name"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case character = "character"
        case creditID = "credit_id"
        case episodeCount = "episode_count"
    }
}

struct TvCrew: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let firstAirDate: String?
    let name: String?
    let voteAverage: Double?
    let voteCount: Int?
    let creditID: String?
    let department: String?
    let episodeCount: Int?
    let job: String?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id = "id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name = "name"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case creditID = "credit_id"
        case department = "department"
        case episodeCount = "episode_count"
        case job = "job"
    }
}

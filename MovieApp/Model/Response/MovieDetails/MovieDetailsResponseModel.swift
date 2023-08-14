//
//  MovieDetailsResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieDetailsModel: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: Date?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

extension MovieDetailsModel {
    static var genres: [Genre]?

    var genresText: String {
        let firstThreeGenres = genres?.prefix(3).map { $0 } ?? []
        return firstThreeGenres.map { $0.name ?? "" }.joined(separator: ", ")
    }

    var localizedReleaseDate: String? {
        DateFormatter.localizedDateFormatter.string(from: releaseDate ?? .now)
    }

    var runtimeText: String {
        let runtime = runtime ?? 0
        return String(format: "%d %@", runtime, L10n.movieDetailsDuration)
    }
}

struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}

struct ProductionCountry: Codable {
    let iso: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso = "iso_3166_1"
        case name = "name"
    }
}

struct SpokenLanguage: Codable {
    let englishName: String?
    let iso: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso = "iso_639_1"
        case name = "name"
    }
}

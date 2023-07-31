//
//  MovieModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieModel: Decodable, Identifiable {
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    static var genres: [Genre]?

    func genreNames() -> String {
        guard let genres = MovieModel.genres, let genreIDS else {
            return ""
        }

        var genreNames: [String] = []
            for id in genreIDS {
                if let genre = genres.first(where: { $0.id == id }), let name = genre.name {
                    genreNames.append(name)
                }
            }

        return genreNames.joined(separator: ", ")
    }
}

struct Dates: Decodable {
    let maximum, minimum: String?
}

//
//  TvModel.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TvModel: Decodable {
    let id: Int?
    let title: String?
    let voteAverage: Double?
    let posterPath: String?
    let genreIDs: [Int]?
    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case genreIDs = "genre_ids"
    }
}

extension TvModel {
    static var genres: [Genre]?
    var genreNames: String {
        guard let genres = TvModel.genres, let genreIDs else {
            return ""
        }
        var genreNames: [String] = []
        for id in genreIDs {
            if let genre = genres.first(where: { $0.id == id }), let name = genre.name {
                genreNames.append(name)
            }
        }
        return genreNames.joined(separator: ", ")
    }
}

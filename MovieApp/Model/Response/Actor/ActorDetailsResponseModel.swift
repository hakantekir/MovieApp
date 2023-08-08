//
//  ActorDetailsResponseModel.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 8.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ActorDetailsResponseModel: Codable {
    let adult: Bool?
    let alsoKnownAs: [String]?
    let biography, birthday: String?
    let deathday: Date?
    let gender: Int?
    let homepage: String?
    let id: Int?
    let imdbID, knownForDepartment, name, placeOfBirth: String?
    let popularity: Double?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, deathday, gender, homepage, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
}

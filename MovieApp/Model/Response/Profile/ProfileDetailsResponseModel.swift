//
//  ProfileDetailsResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 16.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ProfileDetailsResponseModel: Decodable {
    let avatar: Avatar?
    let id: Int?
    let iso639, iso3166, name: String?
    let includeAdult: Bool?
    let username: String?

    enum CodingKeys: String, CodingKey {
        case avatar, id
        case iso639 = "iso_639_1"
        case iso3166 = "iso_3166_1"
        case name
        case includeAdult = "include_adult"
        case username
    }
}

struct Avatar: Decodable {
    let gravatar: Gravatar?
    let tmdb: Tmdb?
}

struct Gravatar: Decodable {
    let hash: String?
}

struct Tmdb: Decodable {
    let avatarPath: String?

    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
}

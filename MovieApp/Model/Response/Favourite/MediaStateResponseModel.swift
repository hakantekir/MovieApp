//
//  MediaStateResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 24.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MediaStateResponseModel: Decodable {
    let id: Int?
    var favorite: Bool?
    var rating: Double?
    var watchlist: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case favorite
        case rating = "rated"
        case watchlist
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.favorite = try container.decodeIfPresent(Bool.self, forKey: .favorite)
        self.watchlist = try container.decodeIfPresent(Bool.self, forKey: .watchlist)

        if let rating = try? container.decodeIfPresent(Rated.self, forKey: .rating)?.value {
            self.rating = rating
        } else {
            self.rating = nil
        }
    }

    struct Rated: Decodable {
        let value: Double?
    }
}

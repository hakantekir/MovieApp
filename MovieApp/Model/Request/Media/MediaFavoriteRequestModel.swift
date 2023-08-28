//
//  MediaFavoriteRequestModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 23.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MediaFavoriteRequestModel: Encodable {
    let type: String?
    let id: Int?
    let favorite: Bool?

    enum CodingKeys: String, CodingKey {
        case type = "media_type"
        case id = "media_id"
        case favorite
    }
}

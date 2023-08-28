//
//  UpdateFavoriteResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 24.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct UpdateFavoriteResponseModel: Decodable {
    let success: Bool?
    let statusCode: Int?
    let statusMessage: String?

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

//
//  FavoriteMoviesResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct FavoriteMoviesResponseModel: Decodable {
    let page: Int?
    let results: [MovieModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

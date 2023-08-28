//
//  FavoriteSeriesResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct FavoriteSeriesResponseModel: Decodable {
    let page: Int?
    let results: [TvModel]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

//
//  TopRatedTvModel.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct TopRatedTvModel: Decodable {
    let tvSeries: [TvModel]?
    enum CodingKeys: String, CodingKey {
        case tvSeries = "results"
    }
}

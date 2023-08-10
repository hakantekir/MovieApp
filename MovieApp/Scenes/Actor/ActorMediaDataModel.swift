//
//  ActorMediaDataModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ActorMediaDataModel: Hashable {
    let type: MediaType
    let id: Int?
    let title: String?
    let path: String?
    let localizedReleaseDate: String?
    let voteAverage: Double?

    enum MediaType {
        case movie
        case tvSeries
    }
}

//
//  ActorMovieCreditsResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct ActorMovieCreditsResponseModel: Decodable {
    let cast: [MovieModel]?
    let id: Int?
}

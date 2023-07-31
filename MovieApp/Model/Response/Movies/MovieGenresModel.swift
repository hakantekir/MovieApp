//
//  MovieGenresModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct MovieGenresModel: Decodable {
    let genres: [Genre]?
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}

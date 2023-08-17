//
//  SearchItemDataModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SearchItemDataModel {
    let type: MediaType
    let id: Int?
    let name: String?
    var overview: String?
    let imagePath: String?

    init(type: MediaType, id: Int?, name: String?, imagePath: String?) {
        self.type = type
        self.id = id
        self.name = name
        self.overview = nil
        self.imagePath = imagePath
    }

    init(type: MediaType, id: Int?, name: String?, overview: String?, imagePath: String?) {
        self.type = type
        self.id = id
        self.name = name
        self.overview = overview
        self.imagePath = imagePath
    }
}

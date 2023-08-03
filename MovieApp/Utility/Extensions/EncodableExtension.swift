//
//  EncodableExtension.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 3.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

extension Encodable {
    func encode() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}

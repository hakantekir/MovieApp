//
//  JSONDecoderExtension.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 3.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var customDecoder: JSONDecoder {
        let formatter = DateFormatter()
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            if let date = formatter.date(from: dateString) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd"
            if let date = formatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container,
                                                debugDescription: "Cannot decode date string \(dateString)")
        }
        return decoder
    }
}

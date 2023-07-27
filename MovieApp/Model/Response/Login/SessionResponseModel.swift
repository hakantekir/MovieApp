//
//  SessionResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct SessionResponseModel: Decodable {
    let success: Bool?
    let sessionId: String?

    enum CodingKeys: String, CodingKey {
        case success
        case sessionId = "session_id"
    }
}

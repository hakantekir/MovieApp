//
//  AuthenticationTokenResponseModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct AuthenticationTokenResponseModel: Decodable {
    let success: Bool
    let requestToken: String

    enum CodingKeys: String, CodingKey {
        case success
        case requestToken = "request_token"
    }
}

//
//  ErrorResponse.swift
//  MovieApp
//
//  Created by Hakan Tekir on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class ErrorResponse: Decodable {
    var success: Bool?
    var code: Int?
    var message: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case code = "status_code"
        case message = "status_message"
    }
}

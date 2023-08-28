//
//  URLManager.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum URLManager {
    case base(path: String)
    case image(imagePath: String)
    case register
    case resetPassword

    var url: String {
        switch self {
            case .base(let path):
                return "\(Configuration.baseURL ?? "")\(path)"
            case .image(imagePath: let imagePath):
                return "\(Configuration.imageURL ?? "")\(imagePath)"
            case .register:
                return "\(Configuration.registerURL ?? "")"
            case .resetPassword:
                return "\(Configuration.resetPasswordURL ?? "")"
        }
    }
}

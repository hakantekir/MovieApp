//
//  RequestObject.swift
//  MovieApp
//
//  Created by Hakan Tekir on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

struct RequestObject {
    var url: String
    let method: HTTPMethod
    var headers: [String: String]?
    var body: Data?
    
    init(url: String,
         method: HTTPMethod = .get,
         headers: [String: String] = [:],
         body: Data? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}

enum HTTPMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

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
    let language: String
    let method: HTTPMethod
    var headers: [String: String]?
    var body: Encodable?

    init(url: String,
         language: String = LocaleManager.currentDeviceLanguage,
         method: HTTPMethod = .get,
         headers: [String: String] = [:],
         body: Encodable? = nil) {
        self.url = url
        self.language = language
        self.method = method
        self.headers = headers
        self.body = body
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

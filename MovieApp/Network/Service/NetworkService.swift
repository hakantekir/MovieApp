//
//  NetworkService.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()

    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        let response = try await NetworkManager.shared.request(with: requestObject, responseModel: T.self)
        return response
    }
}

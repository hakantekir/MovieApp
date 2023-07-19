//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Hakan Tekir on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class NetworkManager {
    
    func request<T: Decodable>(with requestObject: RequestObject, responseModel: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: prepareURLRequest(with: requestObject))
        let successCodeRange = 200...299
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { throw NetworkError.badResponse }
        guard successCodeRange.contains(statusCode) else { throw NetworkError.httpError(status: HTTPStatus(rawValue: statusCode) ?? .notValidCode) }// Data ?
        do {
            let decodedData = try JSONDecoder().decode(responseModel, from: data)
            return decodedData
        } catch {
            throw NetworkError.mappingFailed(data: data)
        }
    }
    
    private func prepareURLRequest(with requestObject: RequestObject) throws -> URLRequest {
        guard let url = URL(string: requestObject.url) else { throw NetworkError.badURL(requestObject.url) }
        var request = URLRequest(url: url)
        request.httpMethod = requestObject.method.rawValue
        request.allHTTPHeaderFields = requestObject.headers
        request.httpBody = requestObject.body
        
        return request
    }
}

//
//  NetworkError.swift
//  MovieApp
//
//  Created by Hakan Tekir on 18.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum NetworkError: Error, Equatable {
    case httpError(status: HTTPStatus, data: Data? = nil)
    case badURL(_ url: String)
    case unknown(error: NSError)
    case customError(_ code: Int, _ message: String, _ data: Data? = nil)
    case mappingFailed(data: Data? = nil)
    case badResponse

    var errorCode: Int {
        switch self {
            case .httpError(let error, _):
                return error.rawValue
            case .unknown(let error):
                return error.code
            case .customError(let code, _, _):
                return code
            case .mappingFailed:
                return 0
            case .badResponse:
                return 0
            case .badURL:
                return 0
        }
    }
    var response: ErrorResponse? {
        getResponse()
    }
}

extension NetworkError {
    private func getResponse() -> ErrorResponse? {
        switch self {
            case .httpError(_, let data), .customError(_, _, let data):
                guard let data = data else {
                    return nil
                }
                let response = try? JSONDecoder().decode(ErrorResponse.self, from: data)
                return response
            case .badResponse, .mappingFailed, .unknown, .badURL:
                return nil
        }
    }
}

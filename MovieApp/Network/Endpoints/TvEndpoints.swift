//
//  TvEndpoints.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum TvEndpoints: EndpointProtocol {
    case popular
    case topRated
    case genres
    case tvDetails(tvID: Int)
    var path: String {
        switch self {
            case .popular:
            return (Configuration.baseURL ?? "") + "tv/popular" + LocaleEndpoint.deviceLanguage.path
            case .topRated:
                return (Configuration.baseURL ?? "") + "tv/top_rated" + LocaleEndpoint.deviceLanguage.path
            case .genres:
                return (Configuration.baseURL ?? "") + "/genre/tv/list" + LocaleEndpoint.deviceLanguage.path
            case .tvDetails:
                return (Configuration.baseURL ?? "") + "/tv/"
        }
    }
    func createObjectRequest() -> RequestObject {
        switch self {
            case .tvDetails(let tvID):
                return RequestObject(url: self.path + String(tvID) + LocaleEndpoint.deviceLanguage.path)
            default:
                return RequestObject(url: self.path)
        }
    }
}

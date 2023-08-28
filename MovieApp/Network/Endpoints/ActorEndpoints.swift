//
//  ActorEndpoints.swift
//  MovieApp
//
//  Created by Hakan Tekir on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum ActorEndpoints: EndpointProtocol {
    case actorDetails(actorID: Int)
    case movies(actorID: Int)
    case series(actorID: Int)
    var path: String {
        switch self {
            case .actorDetails(let actorID):
                return URLManager.base(path: "person/\(actorID)").url
            case .movies(let actorID):
                return URLManager.base(path: "person/\(actorID)/movie_credits").url
            case .series(let actorID):
                return URLManager.base(path: "person/\(actorID)/tv_credits").url
        }
    }
}

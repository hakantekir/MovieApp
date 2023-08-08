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
    var path: String {
        switch self {
            case .actorDetails(let actorID):
            return (Configuration.baseURL ?? "") + "/person/" + String(actorID)
        }
    }
}

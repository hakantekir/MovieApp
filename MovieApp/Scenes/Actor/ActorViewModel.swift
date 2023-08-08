//
//  ActorViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class ActorViewModel: ObservableObject {
    let actorID: Int
    @Published var actorDetails: ActorDetailsResponseModel?

    init(actorID: Int) {
        self.actorID = actorID
    }

    func fetchDetails() async {
        actorDetails = try? await NetworkService.shared.request(
            with: RequestObject(url: ActorEndpoints.actorDetails(actorID: actorID).path),
            responseModel: ActorDetailsResponseModel.self)
    }

    func fetchMedias() async {
        
    }
}

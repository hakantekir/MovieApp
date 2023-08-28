//
//  ProfileViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 16.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: ProfileDetailsResponseModel?
    @Published var presentAlert = false
    @Published var favoriteMovies: FavoriteMoviesResponseModel?
    @Published var favoriteSeries: FavoriteSeriesResponseModel?
    private var sessionId: String = ""
    private var mainViewModel: MainViewModel?

    func setupMainViewModel(_ mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
    }

    func fetchUser() async {
        guard let sessionId = KeychainManager.shared.load(key: "SessionID") else {
            return
        }
        self.sessionId = sessionId

        user = try? await NetworkManager.shared.request(
            with: RequestObject(url: ProfileEndpoints.details(sessionId: sessionId).path),
            responseModel: ProfileDetailsResponseModel.self
        )
    }

    func fetchMedias() async {
        favoriteMovies = try? await FavoriteManager.shared.favoriteMovies()
        favoriteSeries = try? await FavoriteManager.shared.favoriteSeries()
    }

    func logout() async {
        do {
            let response = try await deleteSession()
            if response.success ?? false {
                if deleteSessionIdFromKeychain() {
                    mainViewModel?.updateLoginState()
                }
            }
        } catch {
            presentAlert = true
        }
    }

    private func deleteSession() async throws -> LogoutResponseModel {
        let requestBody = LogoutRequestModel(sessionId: sessionId)
        let requestObject = RequestObject(url: ProfileEndpoints.deleteSession.path, method: .delete, body: requestBody)
        return try await NetworkManager.shared.request(with: requestObject, responseModel: LogoutResponseModel.self)
    }

    private func deleteSessionIdFromKeychain() -> Bool {
        KeychainManager.shared.delete(key: "SessionID")
    }
}

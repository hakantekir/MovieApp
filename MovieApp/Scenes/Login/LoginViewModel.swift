//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    var requestToken: AuthenticationTokenResponseModel?

    func getRequestToken() async {
        do {
            requestToken = try await NetworkService.shared.request(endpoint: LoginEndpoints.authenticationToken, responseModel: AuthenticationTokenResponseModel.self)
        } catch {
            requestToken = nil
        }
    }
}

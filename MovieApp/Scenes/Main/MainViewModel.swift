//
//  MainViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published
    var loginState: UserLoginState = .logout

    init() {
        loginState = KeychainManager.shared.load(key: "SessionID") != nil ? .login : .logout
    }

    func updateLoginState() {
        if KeychainManager.shared.load(key: "SessionID") != nil {
            loginState = .login
        } else {
            loginState = .logout
        }
    }

    enum UserLoginState {
        case login
        case logout
    }
}

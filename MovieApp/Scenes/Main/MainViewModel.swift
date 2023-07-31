//
//  MainViewModel.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class MainViewModel: ObservableObject {

    func isLoggedIn() -> Bool {
        KeychainManager.shared.load(key: "SessionID") != nil
    }
}

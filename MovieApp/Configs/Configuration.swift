//
//  Configuration.swift
//  boilerplate-ios-swiftui
//
//  Created by Baha Ulug on 1.12.2020.
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import Foundation

final class Configuration {

    static var isProduction: Bool {
        #if Production
            return true
        #else
            return false
        #endif
    }

    static var isAppStore: Bool {
        #if AppStore
            return true
        #else
            return false
        #endif
    }

    static var isDevelopment: Bool {
        #if Development
            return true
        #else
            return false
        #endif
    }

    static var apiKey: String? {
        try? Configuration.value(for: "API_KEY")
    }

    static var baseURL: String? {
        try? Configuration.value(for: "BASE_URL")
    }

    static var resetPasswordURL: String? {
        try? Configuration.value(for: "RESET_PASSWORD_URL")
    }

    static var registerURL: String? {
        try? Configuration.value(for: "REGISTER_URL")
    }
}

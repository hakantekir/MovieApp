//
//  LocaleEndpoint.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

enum LocaleEndpoint {
    case deviceLanguage
    private struct Constants {
        static let languageParam = "?language=%@"
    }
    var path: String {
        switch self {
            case .deviceLanguage:
                return String(format: Constants.languageParam, currentDeviceLanguage)
            }
    }
    var currentDeviceLanguage: String {
        let deviceLanguageCode = Locale.current.language.languageCode?.identifier ?? "en"
        return deviceLanguageCode
    }
}

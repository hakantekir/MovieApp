//
//  LocaleManager.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

class LocaleManager {
    static var currentDeviceLanguage: String {
        Locale.current.language.languageCode?.identifier ?? "en"
    }
}

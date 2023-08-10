//
//  DateFormatterExtension.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 3.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let onlyYearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()

    static let localizedDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
}

//
//  RoundedSearchField.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct RoundedSearchField: View {
    let label: String
    @Binding var text: String
    var body: some View {
        HStack {
            Asset.Images.iconMiniSearch.swiftUIImage
            TextField(label, text: $text)
        }
        .padding(.vertical, 7)
        .padding(.horizontal, 9)
        .background(Asset.Colors.whiteTwo.swiftUIColor)
        .cornerRadius(8)
    }
}

struct RoundedSearchField_Previews: PreviewProvider {
    static var previews: some View {
        RoundedSearchField(label: "Search", text: .constant("Game"))
    }
}

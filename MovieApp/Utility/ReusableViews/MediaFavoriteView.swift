//
//  MediaFavoriteView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 23.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaFavoriteView: View {
    var heartColor: HeartColor

    var body: some View {
        HStack {
            switch heartColor {
                case .red:
                    Asset.Images.heartRed.swiftUIImage
                case .white:
                    Asset.Images.heart.swiftUIImage
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 8)
        .background(Asset.Colors.white.swiftUIColor)
        .cornerRadius(100)
    }

    enum HeartColor {
        case white
        case red
    }
}

struct MediaFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            MediaFavoriteView(heartColor: .red)
            MediaFavoriteView(heartColor: .white)
        }
        .padding()
        .background(Asset.Colors.lightGrayBlue.swiftUIColor)
    }
}

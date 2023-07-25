//
//  LaunchView.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 19.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack {
            Asset.Images.launchBackground.swiftUIImage
                .resizable()
                .scaledToFill()
                .frame(minHeight: 0)

            Asset.Images.launchIcon.swiftUIImage

            VStack {
                Spacer()
                Text("We 🤍 movie")
                    .foregroundColor(Asset.Colors.white.swiftUIColor)
                    .padding(.bottom, 36)
            }
        }.ignoresSafeArea()
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

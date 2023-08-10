//
//  CustomAlert.swift
//  MovieApp
//
//  Created by Hakan Tekir on 26.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct CustomAlert: View {
    var message: String
    var buttonLabel: String
    var action: () -> Void
    var body: some View {
        ZStack {
            Asset.Colors.translucentBackground.swiftUIColor
                .ignoresSafeArea()
            VStack {
                Asset.Images.alertTopImage.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .background(Asset.Colors.vibrantBlue.swiftUIColor)

                Text(message)
                    .padding(.vertical, 24)
                    .padding(.horizontal, 32)

                RoundedButton(label: buttonLabel,
                              foregroundColor: Asset.Colors.white.swiftUIColor,
                              backgroundColor: Asset.Colors.vibrantBlue.swiftUIColor) {
                    action()
                }
                              .padding(.bottom, 32.0)
                              .padding(.horizontal, 88.0)
            }
            .background(Asset.Colors.white.swiftUIColor)
            .cornerRadius(10)
            .padding(50)
        }
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert(message: "Lorem ipsum dolor sit amet",
                    buttonLabel: "Okey", action: {

        }).previewLayout(.sizeThatFits)
    }
}

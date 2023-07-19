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
            Image("launchBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Image("launchIcon")
            VStack {
                Spacer()
                Text("We 🤍 movie")
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 36)
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}

//
//  MediaVoteView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 30.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaVoteView: View {
    let vote: Double
    var body: some View {
        HStack {
            Asset.Images.star.swiftUIImage
            Text(String(format: "%.1f", vote))
                .font(.system(size: 12) .weight(.bold))
        }
        .foregroundColor(Asset.Colors.white.swiftUIColor)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Asset.Colors.vibrantBlue.swiftUIColor)
        .cornerRadius(12)
    }
}

struct MediaVoteView_Previews: PreviewProvider {
    static var previews: some View {
        MediaVoteView(vote: 2.5)
    }
}

//
//  ActorItemView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ActorItemView: View {
    let id: Int
    let name: String
    let imagePath: String
    var body: some View {
        NavigationLink {
            ActorView(actorID: id)
        } label: {
            VStack {
                AsyncImage(url: URL(string: URLManager.image(imagePath: imagePath).url)) { image in
                    image
                        .resizable()
                } placeholder: {
                    Asset.Images.mediaPlaceholder.swiftUIImage
                        .resizable()
                }
                .frame(width: 70, height: 70)
                .clipShape(Circle())

                Text(name)
                    .font(.system(size: 15))
                    .lineLimit(1)
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
            }
            .frame(width: 100)
        }
    }
}

struct ActorItemView_Previews: PreviewProvider {
    static var previews: some View {
        ActorItemView(id: 1,
                      name: "Name",
                      imagePath: "/WCSZzWdtPmdRxH9LUCVi2JPCSJ.jpg")
    }
}

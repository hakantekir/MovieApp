//
//  MediaListItemView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaListItemView: View {
    let media: MovieModel?
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (media?.posterPath ?? "")),
                       content: { image in
                image
                    .resizable()
            }, placeholder: {
                Asset.Images.mediaPlaceholder.swiftUIImage
                    .resizable()
            })
            .frame(width: 70, height: 100)

            VStack(alignment: .leading) {
                Spacer()
                Text(media?.title ?? "Movie")
                    .font(.system(size: 20).bold())
                    .lineLimit(1)
                Spacer()

                Text(media?.genreNames() ?? "")
                    .font(.system(size: 15))
                    .padding(.top, 1)
                Spacer()

                HStack {
                    Asset.Images.calendar.swiftUIImage
                    Text(media?.releaseDate ?? "")
                    Divider()
                        .padding(.horizontal, 4)
                        .frame(height: 12)
                    MediaVoteView(vote: media?.voteAverage ?? 0.0)
                }
                Spacer()
            }
            Spacer()
        }
        .frame(height: 100)
        .background(Asset.Colors.white.swiftUIColor)
        .cornerRadius(8)
    }
}

//
//  MediaListItemView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 28.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaListItemView: View {
    let media: MovieModel
    var body: some View {
        NavigationLink {
            MovieDetailsView(id: media.id ?? 0)
        } label: {
            HStack {
                AsyncImage(url: URL(string: URLManager.image(imagePath: media.posterPath).url),
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
                    Text(media.title ?? "Movie")
                        .font(.system(size: 20).bold())
                        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                        .lineLimit(1)
                    Spacer()

                    Text(media.genreNames)
                        .font(.system(size: 15))
                        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                        .padding(.top, 1)
                    Spacer()

                    HStack {
                        Asset.Images.calendar.swiftUIImage
                        Text(media.localizedReleaseDate ?? "")
                            .font(.system(size: 12))
                            .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                        Divider()
                            .padding(.horizontal, 4)
                            .frame(height: 12)
                        MediaVoteView(vote: media.voteAverage ?? 0.0)
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
}

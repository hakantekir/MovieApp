//
//  ActorMediaView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 10.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ActorMediaView: View {
    let media: ActorMediaDataModel
    var body: some View {
        NavigationLink {
            if media.type == .movie {
                MovieDetailsView(id: media.id ?? 0)
            } else if media.type == .tvSeries {
                TvSeriesDetailsView(id: media.id ?? 0)
            }
        } label: {
            HStack {
                AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (media.path ?? "")),
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
                    Text(media.title ?? "Media")
                        .font(.system(size: 20).bold())
                        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                        .lineLimit(1)
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

struct ActorMediaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ActorMediaView(media: .init(type: .movie,
                                        id: 35795,
                                        title: "Star Wars",
                                        path: "/5TuxIPkudDni4BQDAIx8KCWgqZi.jpg",
                                        localizedReleaseDate: "4 May",
                                        voteAverage: 5.0)
            )
        }
    }
}

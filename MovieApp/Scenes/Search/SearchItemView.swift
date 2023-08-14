//
//  SearchItemView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SearchItemView: View {
    let media: SearchItemDataModel
    var body: some View {
        NavigationLink {
            switch media.type {
                case .movie:
                MovieDetailsView(id: media.id ?? 0)
                case .tvSeries:
                    TvSeriesDetailsView(id: media.id ?? 0)
                case .person:
                    ActorView(actorID: media.id ?? 0)
            }
        } label: {
            HStack {
                image()
                    .padding(.trailing, 10)

                mediaInfo()

                Spacer()
            }
            .frame(height: 100)
            .background(Asset.Colors.white.swiftUIColor)
            .cornerRadius(8)
        }
    }
}

extension SearchItemView {
    private func image() -> some View {
        AsyncImage(url: URL(string: media.imagePath ?? "")) { image in
            image
                .resizable()
        } placeholder: {
            Asset.Images.mediaPlaceholder.swiftUIImage
                .resizable()
        }
        .frame(width: 70, height: 100)
    }

    private func mediaInfo() -> some View {
        VStack(alignment: .leading) {
            Spacer()
            Text(media.name ?? "")
                .font(.system(size: 20).bold())
            Spacer()
            Text(media.overview ?? "")
                .font(.system(size: 15))
            Spacer()
            mediaType()
            Spacer()
        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
    }

    private func mediaType() -> some View {
        HStack {
            switch media.type {
                case .movie:
                Asset.Images.movieIcon.swiftUIImage
                    .resizable()
                    .frame(width: 15, height: 15)
                Text(L10n.searchMovie)
                case .tvSeries:
                Asset.Images.seriesIcon.swiftUIImage
                    .resizable()
                    .frame(width: 15, height: 15)
                Text(L10n.searchSeries)
                case .person:
                Asset.Images.actorIcon.swiftUIImage
                    .resizable()
                    .frame(width: 15, height: 15)
                Text(L10n.searchPerson)
            }
        }
        .font(.system(size: 12))
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
    }
}

struct SearchItemView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemView(media: SearchItemDataModel(type: .movie,
                                    id: 0,
                                    name: "Game Of Thrones",
                                    overview: "Emilia Clarke, Peter Dinklage, Kit Ha...",
                                    imagePath: "/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg"))
        .previewLayout(.sizeThatFits)
    }
}

//
//  TvSmallCardView.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvSmallCardView: View {
    var tvSeriesCollection: [TvModel]
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(tvSeriesCollection, id: \.id) { tvSeries in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Asset.Colors.white.swiftUIColor)
                        .frame(width: 153, height: 310)
                    VStack {
                        NavigationLink {
                            TvSeriesDetailsView(viewModel: TvDetailsViewModel(tvSeriesID: tvSeries.id ?? 0))
                        } label: {
                            posterImage(tvSeries: tvSeries)
                        }
                        Spacer()
                        mediaSummary(tvSeries: tvSeries)
                    }
                }
            }
        }
    }
}

extension TvSmallCardView {
    private func posterImage(tvSeries: TvModel) -> some View {
        AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (tvSeries.posterPath ?? "")),
                   content: { image in
            image
                .resizable()
        }, placeholder: {
            Asset.Images.mediaPlaceholder.swiftUIImage
                .resizable()
        })
        .frame(width: 153, height: 219)
        .roundedCorner(8, corners: [.topLeft, .topRight])
    }
    private func mediaSummary(tvSeries: TvModel) -> some View {
        VStack(alignment: .leading) {
            Text(tvSeries.title ?? "")
                .font(.system(size: 18).bold())
                .lineLimit(1)
            HStack {
                MediaVoteView(vote: tvSeries.voteAverage ?? 0.0)
                Spacer()
            }
            .padding(.bottom, 24)
        }
        .padding(.leading, 24)
    }
}

struct TvSmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        TvSmallCardView(tvSeriesCollection: [TvModel(
                                        id: 1396,
                                        title: "Breaking Bad",
                                        voteAverage: 8.9,
                                        posterPath: "/ggFHVNu6YYI5L9pCfOacjizRGt.jpg",
                                        genreIDs: [18, 80])]
                                        )
        .background(Color.pink)
    }
}

//
//  TvMediaCardView.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvMediaCardView: View {
    var tvSeriesCollection: [TvModel]
    var body: some View {
        GeometryReader { reader in
                TabView {
                    ForEach(tvSeriesCollection, id: \.id) { tvSeries in
                        VStack {
                            NavigationLink {
                                TvSeriesDetailsView(viewModel: TvDetailsViewModel(tvSeriesID: tvSeries.id ?? 0))
                            } label: {
                                posterImage(tvSeries: tvSeries, reader: reader)
                            }
                            mediaSummary(tvSeries: tvSeries)
                                .padding(.leading, 24)
                                .padding(.top, 20)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

extension TvMediaCardView {
    private func posterImage(tvSeries: TvModel, reader: GeometryProxy) -> some View {
        AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (tvSeries.posterPath ?? "")),
                   content: { image in
            image
                .resizable()
        }, placeholder: {
            Asset.Images.mediaPlaceholder.swiftUIImage
                .resizable()
        })
        .frame(width: reader.size.width * 0.7, height: reader.size.width)
    }

    private func mediaSummary(tvSeries: TvModel) -> some View {
        VStack(alignment: .leading) {
            HStack {
                MediaVoteView(vote: tvSeries.voteAverage ?? 0.0)
                Spacer()
            }
            .padding(.bottom, 10)
            Text(tvSeries.title ?? "")
                .font(.system(size: 24).bold())
                .padding(.bottom, 1)
            Text(tvSeries.genreNames)
                .font(.system(size: 15))
        }
    }
}

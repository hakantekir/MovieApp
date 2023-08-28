//
//  MediaCardView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaCardView: View {
    var movies: [MovieModel]
    var body: some View {
        GeometryReader { reader in
                TabView {
                    ForEach(movies, id: \.id) { movie in
                        VStack {
                            NavigationLink {
                                MovieDetailsView(id: movie.id ?? 0)
                            } label: {
                                AsyncImage(url: URL(string: URLManager.image(imagePath: movie.posterPath).url),
                                           content: { image in
                                    image
                                        .resizable()
                                }, placeholder: {
                                    Asset.Images.mediaPlaceholder.swiftUIImage
                                        .resizable()
                                })
                                .frame(width: reader.size.width * 0.7, height: reader.size.width)

                            }
                            mediaSummary(movie: movie)
                                .padding(.leading, 24)
                                .padding(.top, 20)
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

extension MediaCardView {
    private func mediaSummary(movie: MovieModel) -> some View {
        VStack(alignment: .leading) {
            HStack {
                MediaVoteView(vote: movie.voteAverage ?? 0.0)
                Spacer()
            }
            .padding(.bottom, 10)
            Text(movie.title ?? "")
                .font(.system(size: 24).bold())
                .padding(.bottom, 1)
            Text(movie.genreNames)
                .font(.system(size: 15))
        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
    }
}

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
                            AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (movie.posterPath ?? "")),
                                       content: { image in
                                image
                                    .resizable()
                            }, placeholder: {
                                Asset.Images.mediaPlaceholder.swiftUIImage
                                    .resizable()
                            })
                            .frame(width: reader.size.width * 0.7, height: reader.size.width)

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
            Text(movie.genreNames())
                .font(.system(size: 15))
        }
    }
}

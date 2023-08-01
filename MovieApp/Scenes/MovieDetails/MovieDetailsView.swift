//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    let media: MovieModel
    @ObservedObject var viewModel = MovieDetailsViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(alignment: .leading) {
                    posterImage(reader: reader)
                        .frame(height: reader.size.height/2 + 12)

                    movieDetails()
                        .onAppear {
                            Task {
                                guard let id = media.id else {
                                    return
                                }
                                await viewModel.fetchMovieDetails(movieId: id)
                            }
                        }
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Asset.Colors.white.swiftUIColor)
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

extension MovieDetailsView {
    private func posterImage(reader: GeometryProxy) -> some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (media.posterPath ?? "")),
                       content: { image in
                image
                    .resizable()
            }, placeholder: {
                Asset.Images.mediaPlaceholder.swiftUIImage
                    .resizable()
            })
            .frame(height: reader.size.height/2)

            VStack {
                Spacer()
                HStack {
                    MediaVoteView(vote: media.voteAverage ?? 0.0)
                        .padding(.leading, 24)
                    Spacer()
                }
            }
        }
    }

    private func movieDetails() -> some View {
        VStack(alignment: .leading) {
            Text(media.title ?? "Title")
                .font(.system(size: 28).bold())
                .padding(.bottom, 5)

            Text(media.genreNames)
                .font(.system(size: 15))
                .padding(.bottom, 10)

            HStack {
                Asset.Images.time.swiftUIImage
                Text(String(viewModel.movieDetails?.runtime ?? 0) + " min")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Asset.Images.calendar.swiftUIImage
                Text(media.localizedReleaseDate ?? "")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Spacer()
            }

            Text(media.overview ?? "")
                .font(.system(size: 17))
        }.padding(.horizontal, 24)
    }
}

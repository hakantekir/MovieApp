//
//  MovieDetailsView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 31.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    @ObservedObject var viewModel: MovieDetailsViewModel
    @Environment(\.dismiss) private var dismiss

    init(id: Int) {
        viewModel = MovieDetailsViewModel(id: id)
    }

    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    posterImage(reader: reader)
                        .frame(height: reader.size.height/2 + 12)

                    movieDetails()

                    cast()
                }
                .onAppear {
                    Task {
                        await viewModel.fetchMovieDetails()
                        await viewModel.fetchCredits()
                        await viewModel.fetchMovieState()
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

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            await viewModel.updateFavorite()
                        }
                    } label: {
                        MediaFavoriteView(heartColor: viewModel.movieState?.favorite ?? false ? .red : .white)
                    }
                }
            }
        }
        .background(Asset.Colors.white.swiftUIColor)
        .edgesIgnoringSafeArea(.top)
    }
}

extension MovieDetailsView {
    private func posterImage(reader: GeometryProxy) -> some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: URLManager.image(imagePath: viewModel.movieDetails?.posterPath).url),
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
                    MediaVoteView(vote: viewModel.movieDetails?.voteAverage ?? 0.0)
                        .padding(.leading, 24)
                    Spacer()
                }
            }
        }
    }

    private func movieDetails() -> some View {
        VStack(alignment: .leading) {
            Text(viewModel.movieDetails?.title ?? "Title")
                .font(.system(size: 28).bold())
                .padding(.bottom, 5)

            Text(viewModel.movieDetails?.genresText ?? "")
                .font(.system(size: 15))
                .padding(.bottom, 10)

            HStack {
                Asset.Images.time.swiftUIImage
                Text(viewModel.movieDetails?.runtimeText ?? "")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Asset.Images.calendar.swiftUIImage
                Text(viewModel.movieDetails?.localizedReleaseDate ?? "")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Spacer()
            }
            MediaInteractionView(rating: $viewModel.rating,
                                 shareURL: "https://www.themoviedb.org") { rating in
                Task {
                    await viewModel.updateRating(rating: rating)
                }
            }
            .padding(.top, 18.0)

            Divider()
                .padding(.vertical, 20)

            Text(viewModel.movieDetails?.overview ?? "")
                .font(.system(size: 17))
                .padding(.bottom, 25)
                .lineSpacing(7)
        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
        .padding(.horizontal, 24)
    }

    private func cast() -> some View {
        VStack(alignment: .leading) {
            Text(L10n.movieDetailsCast)
                .font(.system(size: 28).bold())
                .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                .padding(.horizontal, 24)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.cast?.cast ?? [], id: \.id) { actor in
                        ActorItemView(id: actor.id ?? 0,
                                      name: actor.name ?? "",
                                      imagePath: actor.profilePath ?? "")
                    }
                }
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MovieDetailsView(id: 569094)
        }
    }
}

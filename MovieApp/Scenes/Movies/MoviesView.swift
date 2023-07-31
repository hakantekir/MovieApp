//
//  MoviesView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 27.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    @ObservedObject private var viewModel = MoviesViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    VStack {
                        Asset.Colors.vibrantBlue.swiftUIColor
                            .ignoresSafeArea(.container)
                            .frame(height: 100)
                        Spacer()
                    }
                    .onFirstAppear {
                        Task {
                            await viewModel.fetchMovieGenres()
                            await viewModel.fetchNowPlayingMovies()
                            await viewModel.fetchPopularMovies()
                        }
                    }

                    VStack {
                        MediaCardView(movies: viewModel.nowPlayingMovies?.results ?? [])
                            .frame(height: 560)

                        VStack(alignment: .leading) {
                            Divider()
                                .padding(.bottom, 20.0)
                            Text("Popular")
                                .font(.system(size: 22).bold())
                            ForEach(viewModel.popularMovies?.results ?? [], id: \.id) { movie in
                                MediaListItemView(media: movie)
                                    .padding(.bottom, 20)
                            }
                        }
                        .padding(24)
                    }
                }
            }
            .navigationTitle(L10n.movies)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Asset.Colors.vibrantBlue.swiftUIColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Asset.Colors.whiteTwo.swiftUIColor)
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

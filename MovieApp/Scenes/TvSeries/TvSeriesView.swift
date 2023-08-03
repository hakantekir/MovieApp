//
//  TvSeriesView.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvSeriesView: View {
    @StateObject private var viewModel = TvSeriesViewModel()
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ZStack {
                    VStack {
                        Asset.Colors.vibrantBlue.swiftUIColor
                            .ignoresSafeArea(.container)
                            .frame(height: 100)
                        Spacer()
                    }
                    VStack {
                        TvMediaCardView(tvSeriesCollection: viewModel.popularTvSeries?.tvSeries ?? [])
                                .frame(height: 560)
                        VStack(alignment: .leading) {
                            Divider()
                                .padding(.bottom, 20)
                            Text(L10n.tvSeriesTopRated)
                                .font(.system(size: 22).bold())
                            TvSmallCardView(tvSeriesCollection: viewModel.topRatedTvSeries?.tvSeries ?? [])
                        }
                        .padding(24)
                    }
                }
                .navigationTitle(L10n.tvSeriesNavigationTitle)
                .onAppear {
                    Task {
                        await viewModel.fetchPopularTvSeries()
                        await viewModel.fetchTopRatedTvSeries()
                        await viewModel.fetchTvGenres()
                    }
                }
            }
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Asset.Colors.vibrantBlue.swiftUIColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Asset.Colors.whiteTwo.swiftUIColor)
        }
    }
}

struct TvSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesView()
    }
}

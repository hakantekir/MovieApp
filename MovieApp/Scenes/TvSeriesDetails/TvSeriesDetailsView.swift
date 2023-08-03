//
//  TvSeriesDetailsView.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 1.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TvSeriesDetailsView: View {
    @ObservedObject private var viewModel: TvDetailsViewModel
    init(viewModel: TvDetailsViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(alignment: .leading) {
                    posterImage(reader: reader)
                        .frame(height: reader.size.height/2 + 12)
                    movieDetails()
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
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                await viewModel.fetchTvSeriesDetails()
            }
        }
    }
}

extension TvSeriesDetailsView {
    private func posterImage(reader: GeometryProxy) -> some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (viewModel.tvSeriesDetails?.posterPath ?? "")),
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
                    MediaVoteView(vote: viewModel.tvSeriesDetails?.voteAverage ?? 0.0)
                        .padding(.leading, 24)
                    Spacer()
                }
            }
        }
    }

    private func movieDetails() -> some View {
        VStack(alignment: .leading) {
            Text(viewModel.tvSeriesDetails?.name ?? "Title")
                .font(.system(size: 28).bold())
                .padding(.bottom, 5)

            Text(viewModel.tvSeriesDetails?.genresText ?? "")
                .font(.system(size: 15))
                .padding(.bottom, 10)

            HStack {
                Asset.Images.time.swiftUIImage
                Text(viewModel.tvSeriesDetails?.runtimeText ?? "")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Asset.Images.calendar.swiftUIImage
                Text(viewModel.tvSeriesDetails?.firstAndLastAirDateText ?? "")
                    .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
                    .font(.system(size: 15))

                Spacer()
            }
            ZStack {
                Rectangle()
                    .frame(width: 81, height: 24)
                    .cornerRadius(12)
                    .foregroundColor(Color(red: 57/255, green: 58/255, blue: 59/255))
                Text(viewModel.tvSeriesDetails?.seasonsText ?? "")
                    .foregroundColor(Asset.Colors.white.swiftUIColor)
                    .font(.system(size: 12) .weight(.bold))
            }
            Text(viewModel.tvSeriesDetails?.overview ?? "")
                .font(.system(size: 17))
        }
        .padding(.horizontal, 24)
    }
}

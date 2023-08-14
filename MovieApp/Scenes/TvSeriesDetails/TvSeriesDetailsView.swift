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
    @Environment(\.dismiss) private var dismiss

    init(id: Int) {
        viewModel = TvDetailsViewModel(tvSeriesID: id)
    }

    var body: some View {
        GeometryReader { reader in
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    posterImage(reader: reader)
                        .frame(height: reader.size.height/2 + 12)

                    movieDetails()

                    if !(viewModel.cast?.cast?.isEmpty ?? true) {
                        cast()
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
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            Task {
                await viewModel.fetchTvSeriesDetails()
                await viewModel.fetchCredits()
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

            Text(viewModel.tvSeriesDetails?.overview ?? "")
                .font(.system(size: 17))
                .lineSpacing(7)

            Text(viewModel.tvSeriesDetails?.seasonsText ?? "")
                .foregroundColor(Asset.Colors.white.swiftUIColor)
                .font(.system(size: 12) .weight(.bold))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(red: 57/255, green: 58/255, blue: 59/255))
                .cornerRadius(12)
        }
        .padding(.horizontal, 24)
    }

    private func cast() -> some View {
        VStack(alignment: .leading) {
            Text(L10n.tvSeriesDetailsCast)
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

struct TvSeriesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TvSeriesDetailsView(id: 1396)
        }
    }
}

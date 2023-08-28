//
//  MediaInteractionView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 25.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MediaInteractionView: View {
    @Binding var rating: Double
    @State private var isRating = false
    var shareURL: String
    var action: (_ rating: Double) -> Task<Void, Never>

    var body: some View {
        HStack(alignment: .top) {
            rateView()

            if isRating {
                rateDetailsView()
                    .padding(.leading, 15)
                    .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            } else {
                if let shareURL = URL(string: shareURL) {
                    shareView(with: shareURL)
                        .padding(.leading, 32)
                        .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
                }
            }
            Spacer()
        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
        .font(.system(size: 15))
    }
}

extension MediaInteractionView {
    private func rateView() -> some View {
        VStack {
            Button {
                withAnimation {
                    isRating.toggle()
                }
            } label: {
                Asset.Images.rate.swiftUIImage
                    .padding(10)
                    .background(Asset.Colors.vibrantBlue.swiftUIColor)
                    .cornerRadius(100)
            }
            Text(L10n.mediaRate)
        }
    }

    private func rateDetailsView() -> some View {
            HStack(spacing: 15) {
                Divider()
                    .frame(height: 40)

                ForEach((1...5), id: \.self) { index in
                    Button {
                        Task {
                            action(Double(index))
                        }
                    } label: {
                        Group {
                            if Double(index) <= rating {
                                Image(systemName: "star.fill")
                            } else {
                                Image(systemName: "star")
                            }
                        }
                        .font(.system(size: 30))
                        .foregroundColor(Asset.Colors.vibrantBlue.swiftUIColor)
                    }
                }
            }
        }

    private func shareView(with url: URL) -> some View {
        VStack {
            ShareLink(item: url) {
                Asset.Images.share.swiftUIImage
                    .padding(10)
                    .background(Asset.Colors.vibrantBlue.swiftUIColor)
                    .cornerRadius(100)
            }
            Text(L10n.mediaShare)
        }
    }
}

struct MediaInteractionView_Previews: PreviewProvider {
    @State static var rating = 2.0
    static var url = "https://www.themoviedb.org"
    static var previews: some View {
        MediaInteractionView(rating: $rating, shareURL: url) { rating in
            Task {
                print(rating)
                self.rating = rating
            }
        }
    }
}

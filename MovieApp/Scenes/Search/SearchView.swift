//
//  SearchView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 11.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Asset.Colors.vibrantBlue.swiftUIColor
                        .frame(height: 150)
                    Spacer()
                }
                VStack {
                    HStack {
                        RoundedSearchField(label: L10n.searchSearchBar, text: $viewModel.query)
                    }.padding(.horizontal, 24)
                    if !viewModel.query.isEmpty {
                        if let searchResults = viewModel.searchResults, !searchResults.isEmpty {
                            ScrollView {
                                ForEach(searchResults, id: \.id) { result in
                                    SearchItemView(media: result)
                                        .padding(.bottom, 20)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.top, 24)
                        } else if viewModel.isLoading {
                            VStack {
                                Spacer()
                                ProgressView()
                                Spacer()
                            }
                        } else {
                            VStack {
                                Spacer()
                                Asset.Images.illustrationSearch.swiftUIImage
                                Text(L10n.searchNone)
                                    .font(.system(size: 18).bold())
                                    .multilineTextAlignment(.center)
                                    .lineSpacing(6)
                                    .foregroundColor(Asset.Colors.vibrantBlue.swiftUIColor)
                                    .frame(maxWidth: 200)
                                Spacer()
                            }
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle(L10n.searchNavigationTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Asset.Colors.vibrantBlue.swiftUIColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Asset.Colors.whiteTwo.swiftUIColor)
        }
        .onChange(of: viewModel.query) { _ in
            Task {
                await viewModel.fetchResults()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

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
                navigationBackground()
                VStack {
                    HStack {
                        RoundedSearchField(label: L10n.searchSearchBar, text: $viewModel.query)
                    }.padding(.horizontal, 24)
                    if !viewModel.query.isEmpty {
                        if !viewModel.searchResults.isEmpty {
                            searchResults(with: viewModel.searchResults)
                        } else if viewModel.isLoading {
                            loadingView()
                        } else {
                            anyResult()
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

extension SearchView {
    private func navigationBackground() -> some View {
        VStack {
            Asset.Colors.vibrantBlue.swiftUIColor
                .frame(height: 150)
            Spacer()
        }
    }

    private func searchResults(with results: [SearchItemDataModel]) -> some View {
        ScrollView {
            ForEach(results, id: \.id) { result in
                SearchItemView(media: result)
                    .padding(.bottom, 20)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }

    private func loadingView() -> some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }

    private func anyResult() -> some View {
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

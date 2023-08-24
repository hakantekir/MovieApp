//
//  TabBarView.swift
//  MovieApp
//
//  Created by Akgoz, Ilgin on 2.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                MoviesView()
                    .tabItem {
                        selectedTab == 0 ? Asset.Images.moviesTabIconSelected.swiftUIImage : Asset.Images.moviesTabIcon.swiftUIImage
                    }
                    .tag(0)
                TvSeriesView()
                    .tabItem {
                        selectedTab == 1 ? Asset.Images.tvTabIconSelected.swiftUIImage : Asset.Images.tvTabIcon.swiftUIImage
                    }
                    .tag(1)
                SearchView()
                    .tabItem {
                        selectedTab == 2 ? Asset.Images.searchTabIconSelected.swiftUIImage : Asset.Images.searchTabIcon.swiftUIImage
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        selectedTab == 3 ? Asset.Images.profileTabIconSelected.swiftUIImage : Asset.Images.profileTabIcon.swiftUIImage
                    }
                    .tag(3)
            }
            .toolbarBackground(
                Asset.Colors.whiteTwo.swiftUIColor,
                for: .tabBar)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

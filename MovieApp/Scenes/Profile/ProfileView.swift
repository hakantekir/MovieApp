//
//  ProfileView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 15.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    navigationBackground()

                    // TODO: Favorite Medias

                    Spacer()
                }
            }
            .navigationTitle(L10n.profileNavigationTitle)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(Asset.Colors.vibrantBlue.swiftUIColor, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .background(Asset.Colors.whiteTwo.swiftUIColor)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            await viewModel.logout()
                        }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(Asset.Colors.white.swiftUIColor)
                    }
                }
            }
        }
    }
}

extension ProfileView {
    private func navigationBackground() -> some View {
        VStack {
            VStack {
                HStack {
                    Text(L10n.profileHello)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    Text(viewModel.user?.username ?? "")
                        .font(.system(size: 25).bold())
                    Spacer()
                }
            }
            .foregroundColor(Asset.Colors.white.swiftUIColor)
            .frame(height: 150)
            .padding(.horizontal, 24)
            .background(Asset.Colors.vibrantBlue.swiftUIColor)
            .onAppear {
                Task {
                    await viewModel.fetchUser()
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

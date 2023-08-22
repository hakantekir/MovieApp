//
//  MainView.swift
//  boilerplate-ios-swiftui
//
//  Created by Cagri Gider on 14.08.2022.
//  Copyright © 2022 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var isActive = false
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        Group {
            if isActive {
                switch viewModel.loginState {
                    case .login:
                        TabBarView()
                    case .logout:
                        LoginView()
                }
            } else {
                LaunchView()
                    .onAppear {
                        withAnimation(.easeIn(duration: 1).delay(1)) {
                            isActive = true
                        }
                    }
            }
        }.environmentObject(viewModel)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

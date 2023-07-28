//
//  LoginView.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 19.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @State private var presentForgotWebView: Bool = false
    @State private var presentRegisterWebView: Bool = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { reader in
                ZStack {
                    Asset.Images.loginBackground.swiftUIImage
                        .resizable()
                        .scaledToFill()

                    VStack {
                        Asset.Images.launchIcon.swiftUIImage
                            .padding(.bottom, 91.0)

                        loginTextFields(reader: reader)

                        loginButtons()
                        .id(1)
                    }
                    .padding(.horizontal, 24)

                    if viewModel.presentAlert {
                        customAlert(reader: reader)
                    }
                }
            }
        }
        .ignoresSafeArea(.container)
        .background(Asset.Colors.vibrantBlue.swiftUIColor)
        .scrollDismissesKeyboard(.interactively)
        .onAppear {
            Task {
                try await self.viewModel.getRequestToken()
            }
        }
    }
}

extension LoginView {
    private func loginTextFields(reader: ScrollViewProxy) -> some View {
        Group {
            LoginTextField(type: .normal,
                           label: L10n.email,
                           text: $viewModel.username,
                           foregroundColor: Asset.Colors.white.swiftUIColor
            )
            .textInputAutocapitalization(.never)
            .keyboardType(.emailAddress)
            .padding(.bottom, 24)
            .onTapGesture {
                withAnimation {
                    reader.scrollTo(1, anchor: .center)
                }
            }

            LoginTextField(type: .secure,
                           label: L10n.password,
                           text: $viewModel.password,
                           foregroundColor: Asset.Colors.white.swiftUIColor
            )
            .padding(.bottom, 24)
            .keyboardType(.asciiCapable)
            .textInputAutocapitalization(.none)
            .onTapGesture {
                withAnimation {
                    reader.scrollTo(1, anchor: .center)
                }
            }
        }
    }

    private func loginButtons() -> some View {
        Group {
            HStack {
                Spacer()
                Button {
                    presentForgotWebView = true
                } label: {
                    Text(L10n.forgotPassword)
                        .foregroundColor(Asset.Colors.white.swiftUIColor)
                }
                .font(.system(size: 12))
                .padding(.bottom, 48.0)
                .sheet(isPresented: $presentForgotWebView) {
                    NavigationStack {
                        if let resetPasswordString = Configuration.resetPasswordURL,
                           let resetPasswordURL = URL(string: resetPasswordString) {
                            WebView(url: resetPasswordURL)
                                .navigationTitle(L10n.forgotPassword)
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                    .presentationDetents([.fraction(0.6), .large])
                    .presentationDragIndicator(.visible)
                }
            }

            RoundedButton(label: L10n.login,
                          foregroundColor: Asset.Colors.vibrantBlue.swiftUIColor,
                          backgroundColor: Asset.Colors.white.swiftUIColor) {
                Task {
                    await viewModel.login()
                }
            }.padding(.bottom, 25)

            HStack {
                Text(L10n.dontHaveAccount)
                    .font(.system(size: 12))
                    .foregroundColor(Asset.Colors.lightGrayBlue.swiftUIColor)
                Button {
                    presentRegisterWebView = true
                } label: {
                    Text(L10n.registerNow)
                        .foregroundColor(Asset.Colors.white.swiftUIColor)
                }
                .font(.system(size: 12))
                .sheet(isPresented: $presentRegisterWebView) {
                    NavigationStack {
                        if let registerString = Configuration.registerURL,
                           let registerURL = URL(string: registerString) {
                            WebView(url: registerURL)
                                .navigationTitle(L10n.registerNow)
                                .navigationBarTitleDisplayMode(.inline)
                        }
                    }
                    .presentationDetents([.fraction(0.6), .large])
                    .presentationDragIndicator(.visible)
                }
            }
        }
    }

    private func customAlert(reader: ScrollViewProxy) -> some View {
        CustomAlert(message: viewModel.alertMessage, buttonLabel: "Okey") {
                withAnimation(.easeIn(duration: 0.5)) {
                    viewModel.presentAlert.toggle()
                }
            }
        .onAppear {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            withAnimation {
                reader.scrollTo(1, anchor: .bottom)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

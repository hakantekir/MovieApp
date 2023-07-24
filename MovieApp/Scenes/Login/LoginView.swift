//
//  LoginView.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 19.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
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
                }
            }
        }
        .ignoresSafeArea(.container)
        .background(Asset.Colors.vibrantBlue.swiftUIColor)
        .scrollDismissesKeyboard(.interactively)
    }
}

extension LoginView {
    private func loginTextFields(reader: ScrollViewProxy) -> some View {
        Group {
            LoginTextField(type: .normal,
                           label: L10n.email,
                           text: $email,
                           foregroundColor: .white
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
                           text: $password,
                           foregroundColor: .white
            )
            .padding(.bottom, 24)
            .keyboardType(.asciiCapable)
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
                    print("forgot")
                } label: {
                    Text(L10n.forgotPassword)
                        .foregroundColor(.white)
                }
                .font(.system(size: 12))
                .padding(.bottom, 48.0)
            }

            RoundedButton(label: L10n.login,
                          foregroundColor: Asset.Colors.vibrantBlue.swiftUIColor,
                          backgroundColor: .white) {
                print("login")
            }.padding(.bottom, 25)

            HStack {
                Text(L10n.dontHaveAccount)
                    .font(.system(size: 12))
                    .foregroundColor(Asset.Colors.lightGrayBlue.swiftUIColor)
                Button {
                    print("register")
                } label: {
                    Text(L10n.registerNow)
                        .foregroundColor(.white)
                }
                .font(.system(size: 12))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

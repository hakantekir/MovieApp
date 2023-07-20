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
        ZStack {
            Image("loginBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(minHeight: 0)
            VStack {
                Image("launchIcon")
                    .padding(.bottom, 91)
                LoginTextField(type: .normal, label: "email".localized, text: $email, foregroundColor: .white)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .padding(.bottom, 24)
                LoginTextField(type: .secure, label: "password".localized, text: $password, foregroundColor: .white)
                    .padding(.bottom, 24)
                    .keyboardType(.asciiCapable)
                HStack {
                    Spacer()
                    Button {
                        print("forgot")
                    } label: {
                        Text("forgot_password")
                            .foregroundColor(.white)
                    }
                    .font(.system(size: 12))
                    .padding(.bottom, 48.0)
                }
                RoundedButton(label: "login".localized, foregroundColor: .vibrantBlue, backgroundColor: .white) {
                    print("login")
                }
                .padding(.bottom, 25)
                HStack {
                    Text("dont_have_account")
                        .font(.system(size: 12))
                        .foregroundColor(.lightGrayBlue)
                    Button {
                        print("register")
                    } label: {
                        Text("register_now")
                            .foregroundColor(.white)
                    }.font(.system(size: 12))
                }
            }.padding(.horizontal, 24)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

//
//  LoginTextField.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 19.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

enum TextFieldType {
    case normal
    case secure
}

struct LoginTextField: View {
    let type: TextFieldType
    let label: String
    @Binding var text: String
    let foregroundColor: Color
    @State private var isSecure = true
    @FocusState private var textFocused: Bool
    @FocusState private var secureFocused: Bool
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .font(.system(size: 12))
                    .foregroundColor(foregroundColor)
                Spacer()
            }
                if type == .secure {
                    HStack {
                        ZStack {
                            TextField("", text: $text)
                                .font(.system(size: 17))
                                .foregroundColor(foregroundColor)
                                .textContentType(.password)
                                .keyboardType(.asciiCapable)
                                .focused($textFocused)
                                .opacity(isSecure ? 0 : 1)
                                .autocorrectionDisabled(true)
                            SecureField("", text: $text)
                                .font(.system(size: 17))
                                .foregroundColor(foregroundColor)
                                .textContentType(.password)
                                .keyboardType(.asciiCapable)
                                .focused($secureFocused)
                                .opacity(isSecure ? 1 : 0)
                                .autocorrectionDisabled(true)
                        }
                        Button {
                            isSecure.toggle()
                                if textFocused {
                                    secureFocused  = true
                                } else if secureFocused {
                                    textFocused = true
                                }
                        } label: {
                            Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill").foregroundColor(foregroundColor)
                        }
                    }
                } else {
                    TextField("", text: $text)
                        .font(.system(size: 17))
                        .foregroundColor(foregroundColor)
                }
            Divider()
                .frame(height: 1)
                .overlay(Color.lightGrayBlue)
        }
    }
}

struct LoginTextField_Previews: PreviewProvider {
    static var previews: some View {
        LoginTextField(type: .secure, label: "Email", text: .constant("test"), foregroundColor: .black)
    }
}

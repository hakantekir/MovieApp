//
//  RoundedButton.swift
//  MovieApp
//
//  Created by Tekir, Hakan on 19.07.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    var label: String
    let foregroundColor: Color
    let backgroundColor: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
                .foregroundColor(foregroundColor)
                .font(.system(size: 17).bold())
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(4)
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(label: "Hello", foregroundColor: .white, backgroundColor: .blue,
                      action: {})
    }
}

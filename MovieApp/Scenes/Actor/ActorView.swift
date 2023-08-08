//
//  ActorView.swift
//  MovieApp
//
//  Created by Hakan Tekir on 7.08.2023.
//  Copyright © 2023 Adesso Turkey. All rights reserved.
//

import SwiftUI

struct ActorView: View {
    @ObservedObject var viewModel: ActorViewModel
    @State var isLineLimited = true
    @Environment(\.dismiss) private var dismiss

    init(actorID: Int) {
        viewModel = .init(actorID: actorID)
    }
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(alignment: .leading) {
                    profileImage(reader: reader)
                    actorDetails()
                }
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Asset.Colors.white.swiftUIColor)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                await viewModel.fetchDetails()
            }
        }
    }
}

extension ActorView {
    private func profileImage(reader: GeometryProxy) -> some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: (Configuration.imageURL ?? "") + (viewModel.actorDetails?.profilePath ?? "")),
                       content: { image in
                image
                    .resizable()
            }, placeholder: {
                Asset.Images.mediaPlaceholder.swiftUIImage
                    .resizable()
            })
            .frame(height: reader.size.height/2)
        }
    }

    private func actorDetails() -> some View {
        VStack(alignment: .leading) {
            Text(viewModel.actorDetails?.name ?? "")
                .font(.system(size: 28 ).bold())
                .padding(.bottom, 15)

            Text(viewModel.actorDetails?.biography ?? "")
                .font(.system(size: 17))
                .lineLimit(isLineLimited ? 4 : .max)
                .lineSpacing(7)
                .padding(.bottom, 10)
            Button {
                isLineLimited.toggle()
            } label: {
                Text(isLineLimited ? L10n.actorDetailsShowBio : L10n.actorDetailsHideBio)
                    .font(.system(size: 17).bold())
                    .foregroundColor(Asset.Colors.vibrantBlue.swiftUIColor)
            }
            .padding(.bottom, 14)

            HStack {
                Text(L10n.actorDetailsBorn)
                    .bold()
                Text(viewModel.actorDetails?.birthday ?? "")
            }
            .font(.system(size: 17))

        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
        .padding(.horizontal, 24)
    }

    func movies() -> some View {
        VStack {
            
        }
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorView(actorID: 1)
    }
}

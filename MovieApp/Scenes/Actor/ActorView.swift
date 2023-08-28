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
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    profileImage(reader: reader)
                    actorDetails()
                    medias()
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
        .background(Asset.Colors.white.swiftUIColor)
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            Task {
                await viewModel.fetchDetails()
                await viewModel.fetchMedias()
            }
        }
    }
}

extension ActorView {
    private func profileImage(reader: GeometryProxy) -> some View {
        ZStack(alignment: .top) {
            AsyncImage(url: URL(string: URLManager.image(imagePath: viewModel.actorDetails?.profilePath).url),
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
                Text(viewModel.actorDetails?.bornText ?? "")
            }
            .font(.system(size: 17))
        }
        .foregroundColor(Asset.Colors.almostBlack.swiftUIColor)
        .padding(.horizontal, 24)
    }

    func medias() -> some View {
        VStack {
            ForEach(viewModel.credits ?? [], id: \.self) { media in
                ActorMediaView(media: media)
            }
        }
        .padding(.horizontal, 24)
    }
}

struct ActorView_Previews: PreviewProvider {
    static var previews: some View {
        ActorView(actorID: 1)
    }
}

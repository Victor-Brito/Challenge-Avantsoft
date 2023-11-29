//
//  ReactionView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct ReactionsView: View {
    @StateObject private var viewModel = ReactionsViewModel()

    var body: some View {
        VStack {
            Spacer()
            HStack {
                ReactionButtonComponent(symbol: "heart.fill", count: viewModel.heartCount) {
                    viewModel.incrementHeart()
                }

                Spacer()

                ReactionButtonComponent(symbol: "flame.fill", count: viewModel.fireCount) {
                    viewModel.incrementFire()
                }
            }
        }
        .padding(.bottom, 40)
    }
}

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
                ReactionButtonComponent(symbol: "heart", count: viewModel.heartCount, action: {
                    viewModel.incrementHeart()
                }, buttonColor: .red)
                
                Spacer()
                
                ReactionButtonComponent(symbol: "flame", count: viewModel.fireCount, action: {
                    viewModel.incrementFire()
                }, buttonColor: .yellow)
            }
        }
        .padding(.bottom, 40)
    }
}

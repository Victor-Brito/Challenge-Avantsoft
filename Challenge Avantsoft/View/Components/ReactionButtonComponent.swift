//
//  ReactionButtonView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import SwiftUI

struct ReactionButtonComponent: View {
    
    let symbol: String
    let count: Int
    let action: () -> Void

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Image(systemName: symbol)
                    .tint(Color.white)
                    .shadow(color: .black, radius: 1)
                    .padding(.horizontal, 40)
                    .font(.largeTitle)
            }

            Text("\(count)")
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .padding(.horizontal, 40)
                .font(.largeTitle)
        }
    }
}

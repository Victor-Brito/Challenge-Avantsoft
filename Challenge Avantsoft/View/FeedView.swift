//
//  FeedView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.looks, id: \.self) { look in
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .containerRelativeFrame([.horizontal, .vertical])
                        SwipeView(look: look)
                    }
                    .id(look)
                }
            }
        }
        .coordinateSpace(name: "scroll")
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onAppear {
            viewModel.fetchLook()
        }
    }
}

//
//  TesteSwipe.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct SwipeView: View {
    let constants = Constants()
    @State private var offset: CGSize = .zero
    @State private var cardRemoved = false
    @State private var cell: FeedCellComponent = FeedCellComponent()
    @State private var reactionsModel = ReactionsModel()
    
    var body: some View {
            VStack {
                if !cardRemoved {
                    GeometryReader { geometry in
                        FeedCellComponent()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(offset)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        withAnimation {
                                            offset = gesture.translation
                                        }
                                    }
                                    .onEnded { gesture in
                                        if abs(offset.width) > constants.maxSwipe {
                                            if offset.width > constants.minSwipe {
                                                reactionsModel.incrementFire()
                                            } else {
                                                reactionsModel.incrementHeart()
                                            }
                                            cardRemoved = true
                                            DispatchQueue.main.asyncAfter(deadline: .now() + constants.cardRemoveDispatchTime) {
                                                /// Este dispatchqueue faz com que a view seja adicionada novamente após o swipe
                                                cell = FeedCellComponent()
                                                cardRemoved = false
                                                offset = .zero
                                            }
                                        } else {
                                            offset = .zero
                                        }
                                    }
                            )
                    }
                }
            }
        }
}

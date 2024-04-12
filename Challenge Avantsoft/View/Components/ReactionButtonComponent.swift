//
//  ReactionButtonView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct ReactionButtonComponent: View {
    
    let constants = Constants()
    let designSystem = DesignSystem()
    let symbol: String
    let count: Int
    let action: () -> Void
    let buttonColor: Color
    
    @State private var isTapped = false
    
    var body: some View {
        VStack {
            Button {
                action()
                isTapped.toggle()
            } label: {
                ZStack {
                        Image(systemName: isTapped ? "\(symbol).fill" : symbol)
                        .shadow(color: .black, radius: constants.shadowRadius)
                        .padding(.horizontal, designSystem.xLarge)
                            .font(.largeTitle)
                            .foregroundColor(isTapped ? buttonColor : Color(.systemGray))
                            .animation(.interpolatingSpring(stiffness: designSystem.xxxLarge, damping: designSystem.medium), value: isTapped)
                        
                        Circle()
                        .strokeBorder(lineWidth: isTapped ? designSystem.tiny : designSystem.large)
                        .animation(.easeInOut(duration: constants.animationEaseInReaction).delay(constants.animationDelayReaction), value: isTapped)
                            .frame(width: designSystem.xxLarge, height: designSystem.xxLarge, alignment: .center)
                            .foregroundColor(buttonColor)
                            .hueRotation(.degrees(isTapped ? designSystem.superLarge : designSystem.xxxxLarge))
                            .scaleEffect(isTapped ? designSystem.small : designSystem.tiny)
                            .animation(.easeInOut(duration: constants.animationEaseInReaction), value: isTapped)
                    }
                }
            Text("\(count)")
                .foregroundColor(.white)
                .shadow(color: .black, radius: constants.shadowRadius)
                .padding(.horizontal, designSystem.xLarge)
                .font(.largeTitle)
        }
    }
}

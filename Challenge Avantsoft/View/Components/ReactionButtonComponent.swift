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
                            .shadow(color: .black, radius: 1)
                            .padding(.horizontal, 40)
                            .font(.largeTitle)
                            .foregroundColor(isTapped ? buttonColor : Color(.systemGray))
                            .animation(.interpolatingSpring(stiffness: 170, damping: 15), value: isTapped)
                        
                        Circle()
                            .strokeBorder(lineWidth: isTapped ? 0 : 35)
                            .animation(.easeInOut(duration: 0.5).delay(0.1), value: isTapped)
                            .frame(width: 70, height: 70, alignment: .center)
                            .foregroundColor(buttonColor)
                            .hueRotation(.degrees(isTapped ? 300 : 200))
                            .scaleEffect(isTapped ? 1.3 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isTapped)
                        
                        Image("splash")
                            .opacity(isTapped ? 0 : 1)
                            .animation(.easeInOut(duration: 0.5).delay(0.25), value: isTapped)
                            .scaleEffect(isTapped ? 1.5 : 0)
                            .animation(.easeInOut(duration: 0.5), value: isTapped)
                        
                        Image("splash")
                            .rotationEffect(.degrees(90))
                            .opacity(isTapped ? 0 : 1)
                            .animation(.easeInOut(duration: 0.5).delay(0.2), value: isTapped)
                            .scaleEffect(isTapped ? 1.5 : 0)
                            .animation(.easeOut(duration: 0.5), value: isTapped)
                    }
                }
            Text("\(count)")
                .foregroundColor(.white)
                .shadow(color: .black, radius: 1)
                .padding(.horizontal, 40)
                .font(.largeTitle)
        }
    }
}

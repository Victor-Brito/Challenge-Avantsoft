//
//  Reactions Button.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import SwiftUI

struct ReactionsView: View {
    @State var heart = 225
    @State var fire = 350
    
    var body: some View {
        VStack{
            Spacer()
            HStack {
                VStack {
                    Button {
                       heart += 1
                    } label: {
                        Text("❤️")
                            .padding(.leading, 40)
                            .font(.largeTitle)
                    }
                    Text("\(heart)")
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1)
                        .padding(.leading, 40)
                        .font(.largeTitle)
                }
                Spacer()
                VStack {
                    Button {
                        fire += 1
                    } label: {
                        Text("🔥")
                            .padding(.trailing, 40)
                            .font(.largeTitle)
                    }
                    Text("\(fire)")
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 1)
                        .padding(.trailing, 40)
                        .font(.largeTitle)
                }
            }
        }
        .padding(.bottom, 40)
    }
}

struct Reactions_Button_Previews: PreviewProvider {
    static var previews: some View {
        ReactionsView()
    }
}

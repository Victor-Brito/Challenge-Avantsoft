//
//  ReactionsViewModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import Foundation
import SwiftUI

class ReactionsViewModel: ObservableObject {
    @Published private var model = ReactionsModel()

    var heartCount: Int {
        model.heartCount
    }

    var fireCount: Int {
        model.fireCount
    }
    
    /// Os metodos increment fazem a soma do count, usamos o ObjectWillChange para avisar o SwiftUI para avisar que a prorpiedade do objeto foi alterada, fazendo com que atualize a interface.
    /// O método ObjectWillChange.send() ajuda quando temos um incremento do count e logo após um swipe da tela
    func incrementHeart() {
        model.incrementHeart()
        objectWillChange.send()
    }

    func incrementFire() {
        model.incrementFire()
        objectWillChange.send()
    }
}

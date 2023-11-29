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

    func incrementHeart() {
        model.incrementHeart()
    }

    func incrementFire() {
        model.incrementFire()
    }
}

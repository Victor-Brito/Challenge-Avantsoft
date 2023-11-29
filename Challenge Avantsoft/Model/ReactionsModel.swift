//
//  CountModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import Foundation

struct ReactionsModel {
    private(set) var heartCount: Int {
        didSet {
            saveToUserDefaults()
        }
    }

    private(set) var fireCount: Int {
        didSet {
            saveToUserDefaults()
        }
    }

    init() {
        // Carregar os valores quando inicializa
        self.heartCount = UserDefaults.standard.integer(forKey: "heartCount")
        self.fireCount = UserDefaults.standard.integer(forKey: "fireCount")
    }

    mutating func incrementHeart() {
        heartCount += 1
    }

    mutating func incrementFire() {
        fireCount += 1
    }

    private func saveToUserDefaults() {
        // Salvando os valores no userdefaults
        UserDefaults.standard.set(heartCount, forKey: "heartCount")
        UserDefaults.standard.set(fireCount, forKey: "fireCount")
    }
}


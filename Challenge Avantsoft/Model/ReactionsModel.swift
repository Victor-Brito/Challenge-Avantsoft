//
//  CountModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import Foundation

struct ReactionsModel {
    var heartCount: Int {
        UserDefaults.standard.integer(forKey: "heartCount")
    }

     var fireCount: Int {
         UserDefaults.standard.integer(forKey: "fireCount")
    }

    func incrementHeart() {
        UserDefaults.standard.set(heartCount + 1, forKey: "heartCount")
    }

    func incrementFire() {
        UserDefaults.standard.set(fireCount + 1, forKey: "fireCount")
    }
    
}


//
//  CountModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import Foundation

struct ReactionsModel {
    let constants = Constants()
    var heartCount: Int {
        UserDefaults.standard.integer(forKey: "heartCount")
    }

     var fireCount: Int {
         UserDefaults.standard.integer(forKey: "fireCount")
    }

    func incrementHeart() {
        UserDefaults.standard.set(heartCount + constants.reactionIncrement, forKey: "heartCount")
    }

    func incrementFire() {
        UserDefaults.standard.set(fireCount + constants.reactionIncrement, forKey: "fireCount")
    }
    
}

struct Reactions {
    let videoID: Int
    let fireCount: Int
    let heartCount: Int
}


//
//  VideoLayerModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//

import Foundation

struct Look: Identifiable, Decodable {
    let id: Int
    let compressedForIOSURL: URL
    let body: String
    let profilePictureURL: URL
    let username: String
    let songURL: URL

    enum CodingKeys: String, CodingKey {
        case id, compressedForIOSURL = "compressed_for_ios_url", body, profilePictureURL = "profile_picture_url", username, songURL = "song_url"
    }
}



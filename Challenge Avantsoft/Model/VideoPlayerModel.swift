//
//  VideoLayerModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//

import Foundation

struct Look: Identifiable, Decodable, Hashable {
    let id: Int
    let compressedForIOSURL: URL
    let body: String
    let profilePictureURL: URL
    let username: String
    
    /// O uso do CodingKey se dá ao fato de pegar padrões de string em formatos diferentes do aceito pelo swift, nesse caso o formato que é fornecido pelo arquivo Json é o snake case, dessa forma o CodingKey consegue reorganizar
    enum CodingKeys: String, CodingKey {
        case id,
             compressedForIOSURL = "compressed_for_ios_url",
             body,
             profilePictureURL = "profile_picture_url",
             username
    }
}



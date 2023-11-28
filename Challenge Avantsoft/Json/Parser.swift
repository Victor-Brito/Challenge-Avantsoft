//
//  Parser.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//

import Foundation

func parseJson() -> [Look] {
    let jsonString = """
    {
        "looks": [
           {
             "id": 1,
             "compressed_for_ios_url": "https://ttv-v2-assets.tlprt.shop/processed/compressed-for-ios/f1de865102aff6e13591842cce809487",
             "body": "Love this thrifted top with my handmade choker!",
             "profile_picture_url": "https://ttv-v2-assets.tlprt.shop/images/images/original/e75e755d-b8f4-4cea-98ad-0b1b2837ea97",
             "username": "theperson2"
            },
            {
             "id": 2,
             "compressed_for_ios_url": "https://ttv-v2-assets.tlprt.shop/processed/compressed-for-ios/6913d081064b4a99b5742e8e15e5541a",
             "body": "show ur layers day!",
             "profile_picture_url": "https://ttv-v2-assets.tlprt.shop/images/images/original/e36a8f31-b7f6-42b1-92c5-a2c295991fa3",
             "username": "justanotheruser"
            },
            {
             "id": 3,
             "compressed_for_ios_url": "https://ttv-v2-assets.tlprt.shop/processed/compressed-for-ios-320/c304e853468630dded531b753095de89",
             "body": "Flowers for a rainy day ",
             "profile_picture_url": "https://ttv-v2-assets.tlprt.shop/images/images/original/6ca60112-440d-49ad-8589-9062807cfb05",
             "username": "theuserofoz"
            },
            {
             "id": 4,
             "compressed_for_ios_url": "https://ttv-v2-assets.tlprt.shop/processed/compressed-for-ios-320/aab80170cdeb30d0d22190d4c1e8531a",
             "body": "off to a concert",
             "profile_picture_url": "https://ttv-v2-assets.tlprt.shop/images/images/original/344297ed-45c6-4dfe-8853-0e013213a63b",
             "username": "danielleurban"
            }
        ]
    }
    """

    let data = Data(jsonString.utf8)

    do {
        let looks = try JSONDecoder().decode(Looks.self, from: data)
        return looks.looks
    } catch {
        print(error.localizedDescription)
        return []
    }
}

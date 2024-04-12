//
//  FeedViewModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 12/04/24.
//

import Foundation


class FeedViewModel: ObservableObject {
    @Published var looks: [Look] = []
    
    func fetchLook() {
        guard let looks: Looks = Parser.parseJson(url: URL(fileURLWithPath: Bundle.main.path(forResource: "data", ofType: "json") ?? "")) else {return}
        self.looks = looks.looks
        
    }
    
}

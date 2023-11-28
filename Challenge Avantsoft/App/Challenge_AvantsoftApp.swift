//
//  Challenge_AvantsoftApp.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//

import SwiftUI

@main
struct Challenge_AvantsoftApp: App {
    var body: some Scene {
        WindowGroup {
            if let firstLook = parseJson().first {
                // Aqui, estamos criando um VideoPlayerViewModel usando a URL do primeiro look
                let viewModel = VideoPlayerViewModel(url: firstLook.compressedForIOSURL)
                // Em seguida, passamos o viewModel para a VideoPlayerView
                VideoPlayerView(viewModel: viewModel)
            } else {
                // Handle the case where there are no looks
                Text("No looks available")
            }
        }
    }
}

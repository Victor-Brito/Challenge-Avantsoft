//
//  ContentView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @ObservedObject var viewModel: VideoPlayerViewModel

    init(viewModel: VideoPlayerViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VideoPlayerViewControllerRepresentable(viewModel: viewModel)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.player?.play()
            }
    }
}

struct VideoPlayerViewControllerRepresentable: UIViewControllerRepresentable {
    @ObservedObject var viewModel: VideoPlayerViewModel

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = viewModel.player
        controller.showsPlaybackControls = false
        
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}



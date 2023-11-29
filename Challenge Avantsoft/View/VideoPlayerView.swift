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
    
    var look: Look

    init(viewModel: VideoPlayerViewModel, look: Look) {
        self.viewModel = viewModel
        self.look = look
    }

    var body: some View {
        ZStack {
            VideoPlayerViewControllerRepresentable(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewModel.player?.play()
                }
            VStack {
                DetailsView(look: look)
                Spacer()
            }
            
            ReactionsView()
        }
    }
}

struct VideoPlayerViewControllerRepresentable: UIViewControllerRepresentable {
    @ObservedObject var viewModel: VideoPlayerViewModel

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = viewModel.player
        controller.showsPlaybackControls = false
        controller.exitsFullScreenWhenPlaybackEnds = true
        controller.allowsPictureInPicturePlayback = true
        controller.videoGravity = .resizeAspectFill
        
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}



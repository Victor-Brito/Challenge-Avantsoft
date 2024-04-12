//
//  ContentView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/24.
//
import SwiftUI
import AVKit

struct VideoPlayerView: View {
    @State var viewModel = VideoPlayerViewModel()
    
    let look: Look

    var body: some View {
        ZStack {
            VideoPlayerViewControllerRepresentable(viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    viewModel.playVideo(url: look.compressedForIOSURL)
                }
            VStack {
                DetailsView(look: look)
                Spacer()
            }
            
            ReactionsView()
        }
    }
}

/// Essa UIRepresentable é responsável por desativar a timeline do vídeo e transformar em fullscreen
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

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = viewModel.player
    }
}



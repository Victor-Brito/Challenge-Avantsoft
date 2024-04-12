//
//  VideoPlayerViewModel.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 27/11/23.
//
import Foundation
import AVKit

class VideoPlayerViewModel: ObservableObject {
    @Published var player: AVPlayer?
    
    init() {

        /// Verifica quando o video chega ao final fazendo o loop automatico
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { [weak self] _ in
            self?.player?.seek(to: CMTime.zero)
            self?.player?.play()
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func playVideo(url: URL)  {
        self.player = AVPlayer(url: url)
        self.player?.play()
    }
}

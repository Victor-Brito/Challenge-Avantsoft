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
    

    init(url: URL) {
        self.player = AVPlayer(url: url)
        self.player?.play()

        // Verifica quando o video chega ao final e reinicia ele
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { [weak self] _ in
            self?.player?.seek(to: CMTime.zero)
            self?.player?.play()
        }
    }

    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }
}

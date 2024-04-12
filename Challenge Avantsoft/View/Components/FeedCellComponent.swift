//
//  FeedView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct FeedCellComponent: View {
    let look: Look
    
    var body: some View {
        
        /// É passado a viewModel e o objeto Look para a VideoPlayerView, assim pegando vídeo atual e os detalhes (username e foto de perfil)
        VideoPlayerView(look: look)
        
    }
}


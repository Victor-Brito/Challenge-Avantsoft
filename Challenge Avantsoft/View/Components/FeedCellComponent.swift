//
//  FeedView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import SwiftUI

struct FeedCellComponent: View {
    @State private var selectedLookIndex: Int = 1
    
    var body: some View {
            let looks = parseJson()

            if selectedLookIndex < looks.count {
                let selectedLook = looks[selectedLookIndex]

                // Cria um VideoPlayerViewModel usando o video do json
                let viewModel = VideoPlayerViewModel(url: selectedLook.compressedForIOSURL)

                // É passado a viewModel e o objeto Look para a VideoPlayerView, assim pegando vídeo atual e os detalhes (username e foto de perfil)
                VideoPlayerView(viewModel: viewModel, look: selectedLook)
                
            } else {
                fatalError()
            }
        }
    }

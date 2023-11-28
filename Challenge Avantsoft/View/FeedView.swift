//
//  FeedView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//

import SwiftUI

struct FeedView: View {
    @State private var selectedLookIndex: Int = 1 // Pode ser um valor padrão ou qualquer lógica específica
    
    
    var body: some View {
            let looks = parseJson()

            if selectedLookIndex < looks.count {
                let selectedLook = looks[selectedLookIndex]

                // Criamos um VideoPlayerViewModel usando o URL do look selecionado
                let viewModel = VideoPlayerViewModel(url: selectedLook.compressedForIOSURL)

                // Em seguida, passamos o viewModel e o objeto Look para a VideoPlayerView
                VideoPlayerView(viewModel: viewModel, look: selectedLook)
            } else {
                fatalError()
            }
        }
    }

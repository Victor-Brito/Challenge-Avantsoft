//
//  FeedView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct FeedCellComponent: View {
    @State private var selectedLookIndex: Int = 2
    
    var body: some View {
        if let look: Looks = Parser.parseJson(url: URL(fileURLWithPath: Bundle.main.path(forResource: "data", ofType: "json") ?? "")) {
            
            if selectedLookIndex < look.looks.count {
                let selectedLook = look.looks[selectedLookIndex]
                
                /// O VideoPlayerViewModel é criado usando o video do json
                let viewModel = VideoPlayerViewModel(url: selectedLook.compressedForIOSURL)
                
                /// É passado a viewModel e o objeto Look para a VideoPlayerView, assim pegando vídeo atual e os detalhes (username e foto de perfil)
                VideoPlayerView(viewModel: viewModel, look: selectedLook)
                
            } else {
                EmptyView()
            }
        } else {
            EmptyView()
        }
        
        }
    }

//
//  DetailsView.swift
//  Challenge Avantsoft
//
//  Created by Victor Brito on 28/11/23.
//
import SwiftUI

struct DetailsView: View {
    let constants = Constants()
    var look: Look

    var body: some View {
        HStack {
                ///O asyncimage é utilizado pois sem ele o app carrega dados da URL na thread principal, podendo acarretar em bloqueio de interface
                AsyncImage(url: look.profilePictureURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: constants.profilePictureWidth, height: constants.profilePictureHeight)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: constants.profilePictureWidth, height: constants.profilePictureHeight)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                .padding()

                Text(look.body)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: constants.shadowRadius)
            }
        }
}


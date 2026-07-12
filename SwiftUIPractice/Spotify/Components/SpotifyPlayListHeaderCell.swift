//
//  SpotifyPlayListHeaderCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlayListHeaderCell: View {
    var height: CGFloat = 300
    var title: String = "play list title"
    var subTitle: String = "subtiltile"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    var body: some View {
        ImageLoaderView(urlString: imageName)
            .overlay(
                alignment: .bottomLeading,
                content: {
                    VStack (alignment: .leading, spacing: 8) {
                        Text(subTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .lineLimit(2)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(.spotifyWhite)
                    .background(
                        LinearGradient(
                            colors: [
                                shadowColor.opacity(0),
                                shadowColor
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                )
               
                
            })
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack{
        Color.spotifyDarkGray.ignoresSafeArea()
        ScrollView{
            VStack{
                SpotifyPlayListHeaderCell()
            }
        }
        .ignoresSafeArea()
    }
}

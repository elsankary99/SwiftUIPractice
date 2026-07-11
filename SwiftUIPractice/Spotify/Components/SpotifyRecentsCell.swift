//
//  SpotifyRecentsCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Spotify Recent"
    var body: some View {
        HStack(spacing: 10) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height:55, alignment: .leading)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor()
        .clipShape(RoundedRectangle(cornerRadius: 6))

    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
        
    }
}

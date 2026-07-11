//
//  SpotifyImageTitleCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI

struct SpotifyImageTitleCell: View {
    
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    var title: String = "Item Name"
    
    var body: some View {
        VStack (alignment: .leading) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize ,height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .lineLimit(2)
                .padding(4)
            
                
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyImageTitleCell()
    }
}

//
//  SongsRowView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI
import SwiftfulUI

struct SongsRowView: View {
    var imageSize: CGFloat = 50
    var imageName: String = Constants.randomImage
    var title: String = "Some song name"
    var subtitle: String? = "Some artist"
    var onCellPressed: (() -> Void)? = nil
    var onELlipsisPressed: (() -> Void)? = nil
    
    var body: some View {
    HStack (spacing: 8){
        ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
        
        VStack (alignment: .leading, spacing: 4){
            
            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .foregroundStyle(.spotifyWhite)
            
            if let subtitle {
                
                Text(subtitle)
                    .font(.callout)
                    .foregroundStyle(.spotifyLightGray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .lineLimit(1)
        
        Image(systemName: "ellipsis")
            .font(.title2)
            .padding(8)
            .background(Color.spotifyBlack.opacity(0.001))
            .foregroundStyle(.spotifyLightGray)
            .onTapGesture {
                onELlipsisPressed?()
            }

    }
    .background(.black.opacity(0.001))
    .asButton(.press) {
        onCellPressed?()
    }
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack{
            SongsRowView()
            SongsRowView()
            SongsRowView()
            SongsRowView()
        }
    }
}

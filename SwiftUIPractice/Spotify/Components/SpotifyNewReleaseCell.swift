//
//  SpotifyNewReleaseCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New Releaase from"
    var subHeadline: String? = "New Releaase from"
    var title: String? = "New Releaase from"
    var subTitle: String? = "New Releaase from"
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var body: some View {
        VStack {
            recentHeader
            recentCard
        }
        
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        SpotifyNewReleaseCell()
    }
}

extension SpotifyNewReleaseCell {
    var recentHeader: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 50, height: 50)
                .clipShape(.circle)
            VStack (alignment: .leading, spacing: 2) {
                if let headline {
                    Text(headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.spotifyWhite)
                        .lineLimit(1)
                }
                 
                if let subHeadline {
                    Text(subHeadline)
                        .foregroundStyle(.spotifyLightGray)
                        .lineLimit(1)
                }
                
            }
            .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var recentCard: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 140, height: 140)
            
            VStack (alignment: .leading, spacing: 18) {
                VStack (alignment: .leading, spacing: 2) {
                    if let title {
                        Text(title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.spotifyWhite)
                            .lineLimit(1)
                    }
                     
                    if let subTitle {
                        Text(subTitle)
                            .foregroundStyle(.spotifyLightGray)
                            .lineLimit(2)
                    }
                }
                
                HStack {
                    Image(systemName: "plus.circle")
                        .foregroundStyle(.spotifyLightGray)
                        .font(.title3)
                        .onTapGesture {
                            onAddToPlayListPressed?()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "play.circle.fill")
                        .foregroundStyle(.spotifyWhite)
                        .font(.title)
                        .onTapGesture {
                            onPlayPressed?()
                        }

                }
                
                
            }
            .font(.callout)
        }
        .padding(.trailing, 10)
        .background(.spotifyDarkGray)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

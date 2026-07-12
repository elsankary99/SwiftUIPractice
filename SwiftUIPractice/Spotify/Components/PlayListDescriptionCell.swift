//
//  PlayListDescriptionCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 12/07/2026.
//

import SwiftUI

struct PlayListDescriptionCell: View {
    var descriptionText: String = Product.mock.description
    var userName: String = "Ahmed"
    var subheadline: String = "Some headline goes here"
    var onAddToPlayListPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharedPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShuffledPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleSection
            HStack{
                HStack {
                    Image(systemName: "plus.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onAddToPlayListPressed?()
                        }
                    
                    Image(systemName: "arrow.down.circle")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onDownloadPressed?()
                        }
                    
                    Image(systemName: "square.and.arrow.up")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onSharedPressed?()
                        }
                    
                    Image(systemName: "ellipsis")
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onEllipsisPressed?()
                        }
                    
                    
                }
                .offset(x: -8)
                
                HStack {
                    Image(systemName: "shuffle")
                        .font(.system(size: 24))
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onShuffledPressed?()
                        }
                    
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                        .padding(8)
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onPlayPressed?()
                        }

                }
                .foregroundStyle(.spotifyGreen)
                .frame(maxWidth: .infinity,alignment: .trailing)
            }
            .font(.title2)
        }
        .font(.callout)
        .foregroundStyle(.spotifyLightGray)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        PlayListDescriptionCell()
    }
}

extension PlayListDescriptionCell {
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .lineLimit(2)
            HStack(spacing: 8) {
                Image(systemName: "applelogo")
                    .font(.title3)
                    .foregroundStyle(.spotifyGreen)
                Text("Made For ")
                    + Text(userName)
                    .bold()
                    .foregroundStyle(.spotifyWhite)
            }
            Text(subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

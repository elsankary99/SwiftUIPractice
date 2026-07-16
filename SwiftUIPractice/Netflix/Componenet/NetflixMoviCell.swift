//
//  NetflixMoviCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 16/07/2026.
//

import SwiftUI

struct NetflixMoviCell: View {
    var wight: CGFloat = 90
    var height: CGFloat = 140
    var imageName: String = Constants.randomImage
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool = true
    var topTenRanking: Int? = nil
    var body: some View {
        HStack (alignment: .bottom,spacing: -10) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y:20)
            }
            ZStack(
                alignment: .bottom,
                content: {
                    ImageLoaderView(urlString: imageName)
                    
                    VStack (spacing: 0) {
                        if let title,
                           let firstWord = title.components(separatedBy: " ").first {
                            Text(firstWord)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .lineLimit(1)
                        }
                        Text("Recently Added")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .frame(maxWidth: .infinity)
                            .background(.netflixRed)
                            .clipShape(RoundedRectangle(cornerRadius: 2))
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .padding(.horizontal, 4)
                            .opacity(isRecentlyAdded ? 1: 0)
                        
                    }
                    .background(
                        LinearGradient(
                            colors: [
                                Color.netflitBlack.opacity(0),
                                Color.netflitBlack.opacity(0.5),
                                Color.netflitBlack.opacity(0.8),
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    
                })
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .frame(width: wight, height: height)
        }
        .foregroundStyle(.netflitWhite)
    }
}

#Preview {
    ZStack{
        Color.netflitBlack.ignoresSafeArea()
        VStack{
            NetflixMoviCell(topTenRanking: 2)
            NetflixMoviCell()
            NetflixMoviCell(topTenRanking: 10)
        
        }
    }
}

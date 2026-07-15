//
//  NetflixHeroCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 15/07/2026.
//

import SwiftUI
import SwiftfulUI

struct NetflixHeroCell: View {
    var imageName: String = Constants.randomImage
    var isNetflixFilm: Bool = true
    var title: String = "Players"
    var categories: [String] = ["Raunchy", "Romantic", "Comedy"]
    var onBackgroundPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    var onListPressed: (() -> Void)? = nil
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: imageName)
            VStack {
                if isNetflixFilm {
                    HStack (spacing: 8) {
                        Text("N")
                            .foregroundStyle(.netflixRed)
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        Text("FILM")
                            .kerning(3)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.netflixLightGray)
                    }
                }
                
                Text(title)
                    .font(.system(size: 50,weight: .medium,design: .serif))
                
                HStack (spacing: 8) {
                    ForEach(categories, id: \.self) { item in
                         HStack{
                             Text(item)
                             
                             if item != categories.last{
                                 Circle()
                                     .frame(width: 5,height: 5)
                             }
                         }
                    }
                }
                
                HStack (spacing: 16) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixDarkGray)
                    .background(.netflitWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .asButton {
                        
                    }
                    HStack {
                        Image(systemName: "play.fill")
                        Text("My List")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .foregroundStyle(.netflixDarkGray)
                    .background(.netflitWhite)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .asButton {
                        
                    }
                }
                .padding(24)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .foregroundStyle(.netflitWhite)
        .aspectRatio(0.8, contentMode: .fit)
    }
}

#Preview {
    NetflixHeroCell()
        .padding(40)
}

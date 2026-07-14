//
//  BumbleProfileImageCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    var imageName: String = Constants.randomImage
    var percentageRemaning: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleBlack, lineWidth: 2)
            Circle()
                .trim(from: 0, to: percentageRemaning)
                .stroke(.bumbleYellow,lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            ImageLoaderView(urlString: imageName)
                .clipShape(.circle)
                .padding(4)
 
            
        }
        .overlay(alignment: .bottomTrailing,content: {
            if hasNewMessage {
                ZStack {
                    Circle()
                        .fill(.bumbleWhite)
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(4)
                }
                .frame(width: 26, height: 26)
                .offset(x: 4, y: 4)
            }
            
        })
        .frame(width: 75, height: 75)
    }
}

#Preview {
    VStack{
        BumbleProfileImageCell()
        BumbleProfileImageCell()
        BumbleProfileImageCell()
        BumbleProfileImageCell()
    }
}

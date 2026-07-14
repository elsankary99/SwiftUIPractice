//
//  BumbleChatPreviewCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI

struct BumbleChatPreviewCell: View {
    var imageName: String = Constants.randomImage
    var percentageRemaning: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    var isYourMove: Bool = true
    var userName: String = "Ahmed"
    var lastChatMessage: String? = "This is the last message..."
    var body: some View {
        HStack {
            BumbleProfileImageCell(
                imageName: imageName,
                percentageRemaning: percentageRemaning,
                hasNewMessage: hasNewMessage
            )

            VStack(alignment:.leading, content: {
                HStack{
                    Text(userName)
                        .font(.headline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    if isYourMove {
                        Text("Your Move")
                            .font(.callout)
                            .bold()
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(.bumbleYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                    
                }
                if let lastChatMessage {
                    Text(lastChatMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing)
                }
                
                

            })
            .lineLimit(1)
        }
        
    }
}

#Preview {
    BumbleChatPreviewCell()
}

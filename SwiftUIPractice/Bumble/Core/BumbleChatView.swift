//
//  BumbleChatView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI
import SwiftfulRouting

struct BumbleChatView: View {
    @State private var users: [User] = []
    @Environment(\.router) private var router
    var body: some View {
        ZStack{
            Color.bumbleWhite.ignoresSafeArea()
          
            VStack  {
               
                headr
                matchedQueueSection
                chataRecentSection
                

            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    private func getData() async {
        do {
            users = try await DatabaseHelper.getUserss()
        } catch {
            print("\(error)")
        }

    }
}

#Preview {
    BumbleChatView()
}

extension BumbleChatView {
    var headr: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .onTapGesture {
                    router.dismissScreen()
                }
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .font(.title)
        .fontWeight(.medium)
        .padding(16)
    }
    
    var matchedQueueSection: some View {
        VStack(alignment: .leading,spacing: 8){
            Group{
                Text("Match Queue")
                +
                Text(" (\(users.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.leading, 16)
            ScrollView (.horizontal){
                LazyHStack {
                    ForEach(users) { user in
                        BumbleProfileImageCell(
                            imageName: user.image,
                            percentageRemaning: Double.random(in: 0...1),
                            hasNewMessage: Bool.random()
                        )
                    }
                }
                .padding(.leading, 16)
                .frame(height: 100)
                
            }
            .scrollIndicators(.hidden)
        }
    }
    
    var chataRecentSection: some View {
        VStack(alignment: .leading,spacing: 8){
            Group{
                Text("Chats")
                +
                Text(" (Recent")
                    .foregroundStyle(.bumbleGray)
            }
            .padding(.leading, 16)
            ScrollView (.vertical){
                LazyVStack {
                    ForEach(users) { user in
                        BumbleChatPreviewCell(
                            imageName: user.image,
                            percentageRemaning: Double.random(in: 0...1),
                            hasNewMessage: Bool.random(),
                            isYourMove: Bool.random(),
                            userName: user.firstName,
                            lastChatMessage: user.aboutMe
                           
                        )
                    }
                }
                .padding(.horizontal, 16)
 
            }
            .scrollIndicators(.hidden)
        }
    }
}

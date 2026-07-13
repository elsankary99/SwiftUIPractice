//
//  BumbleHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    var sliderSections: [String] = ["Everyone", "Trending"]
    @State var selectedSection = "Everyone"
    //    @AppStorage("selected_section") var selectedSection = "Everyone" // if i want save last selected section in storage
    @State private var users: [User] = []
    @State private var selectedIndex: Int = 1
    @State private var cardOffset: [Int: Bool] = [:]
    @State private var currentSwipeOffset: CGFloat = 0.0

    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            VStack {
                BumbleHeaderSection()
                BumbleSliderSection(
                    sliderSections: sliderSections,
                    selectedSection: $selectedSection
                )

                ZStack {
                    //                    BumbleCardView()
                    //                        .padding(.horizontal)

                    if !users.isEmpty {
                        ForEach(Array(users.enumerated()), id: \.offset) {
                            (index, user) in

                            let previousUser = (selectedIndex - 1) == index
                            let currentUser = selectedIndex == index
                            let nextUser = (selectedIndex + 1) == index
                            if previousUser || currentUser || nextUser {
                                let offsetValue = cardOffset[user.id]

                                userProfileCell(user: user, index: index)
                                    .padding(.horizontal)
                                    .zIndex(Double(users.count - index))
                                    .offset(
                                        x: offsetValue == nil
                                            ? 0
                                            : offsetValue == true ? 900 : -900
                                    )
                            }

                        }
                    } else {
                        ProgressView()
                    }

                    ZStack {
                        Circle()
                            .fill(.bumbleGray.opacity(0.5))
                            .frame(width: 60, height: 60)
                            .scaleEffect(
                                abs(currentSwipeOffset) > 100 ? 1.5 : 1
                            )
                            .overlay(content: {
                                Image(systemName: "xmark")
                                    .font(.title2)
                            })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: -100)
                            .offset(x: min(-currentSwipeOffset, 150))

                        Circle()
                            .fill(.bumbleGray.opacity(0.5))
                            .frame(width: 60, height: 60)
                            .scaleEffect(
                                abs(currentSwipeOffset) > 100 ? 1.5 : 1
                            )
                            .overlay(content: {
                                Image(systemName: "checkmark")
                                    .font(.title2)
                            })
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .offset(x: 100)
                            .offset(x: max(-currentSwipeOffset, -150))

                    }
                    .zIndex(Double(users.count + 99999))
                    .animation(.smooth, value: currentSwipeOffset)

                }
                .frame(maxHeight: .infinity)

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

    private func didUserSelected(index: Int, isLike: Bool) {
        let user = users[index]
        cardOffset[user.id] = isLike
        //        users.remove(at: index)
        selectedIndex += 1

    }

    func userProfileCell(user: User, index: Int) -> some View {
        BumbleCardView(
            user: user,
            userInterested: user.interests,
            userBasics: user.basics,
            onXmarkPressed: {
                didUserSelected(index: index, isLike: false)
            },
            onCheckmarkPressed: {
                didUserSelected(index: index, isLike: true)
            },
        )
        .withDragGesture(
            .horizontal,
            minimumDistance: 10,
            resets: true,
            //                                        animation: <#T##Animation#>,
            rotationMultiplier: 1.05,
            //                                        scaleMultiplier: <#T##CGFloat#>,
            onChanged: { dragOffset in
                currentSwipeOffset = dragOffset.width
            },
            onEnded: { dragOffset in
                print("\(dragOffset.width)")
                if dragOffset.width > 150 {
                    didUserSelected(index: index, isLike: true)
                } else if dragOffset.width < -150 {
                    didUserSelected(index: index, isLike: false)
                }
            }
        )
    }

}

#Preview {
    BumbleHomeView()
}

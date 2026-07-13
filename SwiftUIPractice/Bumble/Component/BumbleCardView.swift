//
//  BumbleCardView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    var user: User = .mock
    private var userInterested: [USerInterest] = User.mock.interests
    private var userBasics: [USerInterest] = User.mock.basics

    @State private var cardFrame: CGRect = .zero
    var body: some View {
        ScrollView {
            LazyVStack {
                mainCard
                    .frame(height: cardFrame.height)

                aboutMeSection
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                userInterstsSection
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)

                locationSection
                    .padding()
                    .padding(.bottom, 100)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .scrollIndicators(.hidden)
        .background(.bumbleBackgroundYellow)
        .overlay(alignment: .bottomTrailing, content: { starSection })
        .clipShape(RoundedRectangle(cornerRadius: 32))
        .readingFrame { frame in
            cardFrame = frame
            print(" Frame :\(frame.height)")

        }
    }
}

#Preview {
    BumbleCardView()
        .padding()
}

extension BumbleCardView {

    func actionTitle(titile: String) -> some View {
        Text(titile)
            .font(.body)
            .foregroundStyle(.bumbleGray)
    }

    var mainCard: some View {
        ZStack(alignment: .bottomLeading) {
            ImageLoaderView(urlString: user.image)
            VStack(alignment: .leading) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

                HStack {
                    Image(systemName: "suitcase")
                    Text(user.work)
                }

                HStack {
                    Image(systemName: "graduationcap")
                    Text(user.education)
                }
                BumbleHeartView()
                    .asButton(.press) {

                    }
            }
            .padding(24)
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.bumbleWhite)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                LinearGradient(
                    colors: [
                        Color.bumbleBlack.opacity(0),
                        Color.bumbleBlack.opacity(0.6),
                        Color.bumbleBlack.opacity(0.9),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        }

    }

    var aboutMeSection: some View {
        VStack(alignment: .leading) {
            actionTitle(titile: "About Me")
            Text(user.aboutMe)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundStyle(.bumbleBlack)
            HStack {
                BumbleHeartView()
                Text("Send a Compliment")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundStyle(.bumbleBlack)
            }
            .padding(.horizontal, 8)
            .padding(.trailing, 8)
            .background(.bumbleYellow)
            .clipShape(RoundedRectangle(cornerRadius: 32))
        }

    }
    var userInterstsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                actionTitle(titile: "My Basics")
                UserInterestedGrid(userInterested: userBasics)
            }

            VStack(alignment: .leading, spacing: 8) {
                actionTitle(titile: "My Interests")
                UserInterestedGrid(userInterested: userInterested)
            }

        }
    }

    var locationSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "mappin.and.ellipse.circle.fill")
                Text(user.firstName + "'s Location")
            }
            .foregroundStyle(.bumbleGray)
            .font(.body)
            .fontWeight(
                .medium
            )

            Text("10 miles away")

            InterestPillView(
                iconName: nil,
                emoje: "🇪🇬",
                text: "Lives in Mansoura, Egypt"
            )

            HStack {
                Circle()
                    .fill(.bumbleYellow)
                    .overlay(content: {
                        Image(systemName: "xmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    })
                    .frame(width: 60, height: 60)
                    .onTapGesture {

                    }

                Spacer(minLength: 0)

                Circle()
                    .fill(.bumbleYellow)
                    .overlay(content: {
                        Image(systemName: "checkmark")
                            .font(.title)
                            .fontWeight(.semibold)
                    })
                    .frame(width: 60, height: 60)
                    .onTapGesture {

                    }
            }
            .padding(.vertical, 25)

            Text("Hide and Report")
                .frame(maxWidth: .infinity, alignment: .center)

        }
    }

    var starSection: some View {
        Image(systemName: "hexagon.fill")
            .foregroundStyle(.bumbleYellow)
            .font(.system(size: 60, weight: .medium))
            .overlay {
                Image(systemName: "star.fill")
                    .foregroundStyle(.bumbleBlack)
                    .font(.system(size: 30, weight: .medium))
            }
            .padding()
    }

}

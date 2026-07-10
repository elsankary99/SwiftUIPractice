//
//  SpotifyHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 11/07/2026.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User? = nil
    @State private var selectedCategory: Category = .all
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()

            ScrollView {
                
                LazyVStack( spacing: 10, pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(width: 200, height: 200)

                        }
                    } header: {
                        header
                    }

                }
                .padding(.top, 8)
                

                
            }
            .scrollIndicators(.hidden)
            .clipped()

        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .task {
            await getUSer()
        }
    }

    private func getUSer() async {
        do {
            currentUser = try await DatabaseHelper.getUserss().first
        } catch {
            print("Error \(error)")
        }
    }
}

#Preview {
    SpotifyHomeView()
}

extension SpotifyHomeView {
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)

                        .background(Color.spotifyWhite)
                        .clipShape(.circle)
                        .onTapGesture {
                            // Add Logic
                        }
                }
            }
            .frame(width: 35, height: 35)

            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            isSelected: selectedCategory == category,
                            title: category.rawValue.uppercased()
                        )
                        .animation(.interactiveSpring, value: selectedCategory)
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            .scrollIndicators(.hidden)

        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)

    }
}

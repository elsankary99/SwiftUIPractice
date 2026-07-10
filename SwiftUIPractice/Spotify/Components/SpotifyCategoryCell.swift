//
//  SpotifyCategoryCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 11/07/2026.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var isSelected: Bool = false
    var title: String = "Music"
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 8)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack{
        Color.spotifyBlack.ignoresSafeArea()
        VStack {
            SpotifyCategoryCell(title: "All")
            SpotifyCategoryCell(isSelected: true, title: "Music")
            SpotifyCategoryCell(isSelected: true)
        }
    }
}

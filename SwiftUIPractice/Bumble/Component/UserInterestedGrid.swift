//
//  UserInterestedGrid.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI
import SwiftfulUI

struct UserInterestedGrid: View {
    var userInterested: [USerInterest] = User.mock.interests
    var body: some View {
        ZStack {
           
                NonLazyVGrid(
                    columns: 2,
                    alignment: .leading,
                    spacing: 8,
                    items: userInterested) { interest in
                        if let interest{
                            InterestPillView(
                                iconName: interest.iconName,
                                emoje: interest.emoji,
                                text: interest.text
                            )
                        } else {
                            EmptyView()
                        }
                    }
            
        }
    }
}

#Preview {
    UserInterestedGrid()
}

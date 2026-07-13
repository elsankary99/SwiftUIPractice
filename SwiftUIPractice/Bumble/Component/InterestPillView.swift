//
//  InterestPillView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI

struct InterestPillView: View {
    var iconName: String? = "heart.fill"
    var emoje: String? = "👊🏻"
    var text: String = "Graduate Degree"
    
    var body: some View {
        HStack {
            if let iconName {
                Image(systemName: iconName)
            } else if let emoje {
                Text(emoje)
            }
            Text(text)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleYellow)
        .clipShape(RoundedRectangle(cornerRadius: 32))
        
    }
}

#Preview {
    InterestPillView()
}

//
//  BumbleHeaderSection.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI

struct BumbleHeaderSection: View {
    var lineHorizontalPressed: (()->Void)?
    var arrowUturnPressed: (()->Void)?
    var sliderHorizontalPressde: (()->Void)?
    
    var body: some View {
        HStack (spacing: 0){
            HStack (spacing: 0){
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(Color.white.opacity(0.001))
                    .onTapGesture {
                        lineHorizontalPressed?()
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(Color.white.opacity(0.001))
                    .onTapGesture {
                        arrowUturnPressed?()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundStyle(.bumbleYellow)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(Color.white.opacity(0.001))
                .onTapGesture {
                    sliderHorizontalPressde?()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.title)
        .fontWeight(.medium)
        .foregroundStyle(.bumbleBlack)
    }
}

#Preview {
    BumbleHeaderSection()
}

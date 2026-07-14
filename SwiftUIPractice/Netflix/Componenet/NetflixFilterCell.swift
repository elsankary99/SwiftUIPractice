//
//  NetflixFilterCell.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI

struct NetflixFilterCell: View {
    var title: String = "Categories"
    var isDropDown: Bool = false
    var isSelected: Bool = false
    var body: some View {
        HStack (spacing: 4) {
            Text(title)
            if isDropDown {
                Image(systemName: "chevron.down")
                    
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack{
            
                    Capsule()
                        .fill(.netflixDarkGray)
                        .opacity(isSelected ? 1 : 0)
                        
                        
               
                Capsule()
                    .stroke(lineWidth: 1)
            }
                
        )
        .foregroundStyle(.netflixLightGray)
        
    }
}

#Preview {
    VStack(){
        NetflixFilterCell(isSelected: true)
        NetflixFilterCell()
    }
}

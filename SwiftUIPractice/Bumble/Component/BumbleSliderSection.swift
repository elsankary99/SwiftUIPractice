//
//  BumbleSliderSection.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI

struct BumbleSliderSection: View {
    var sliderSections: [String] = ["Everyone", "Trending"]
    @Binding var selectedSection: String
    @Namespace private var namespace
    var body: some View {
       
        HStack (alignment: .top, spacing:20){
            ForEach(sliderSections, id: \.self) { section in
                VStack{
                    Text(section)
                        .frame(maxWidth: .infinity)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if section == selectedSection{
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .matchedGeometryEffect(id: "selection", in: namespace)
                    }
                    
                }
                .background(Color.white.opacity(0.001))
                .foregroundStyle( selectedSection == section ? .bumbleBlack : .bumbleGray)
                .onTapGesture {
                    selectedSection = section
                }
            }
        }
        .background(
            Divider()
            ,
            alignment: .bottom
        )
        .animation(.smooth, value: selectedSection)
        .padding()
        
    }
}

#Preview {
    BumbleSliderSection( selectedSection: .constant("Everyone"))
}

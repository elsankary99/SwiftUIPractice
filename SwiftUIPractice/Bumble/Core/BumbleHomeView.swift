//
//  BumbleHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 13/07/2026.
//

import SwiftUI

struct BumbleHomeView: View {
    var sliderSections: [String] = ["Everyone", "Trending"]
    @State var selectedSection = "Everyone"
//    @AppStorage("selected_section") var selectedSection = "Everyone" // if i want save last selected section in storage
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
                    BumbleCardView()
                        .padding(.horizontal)
                }
                .frame(maxHeight: .infinity)
             }
        }
    }
}

#Preview {
    BumbleHomeView()
}

//
//  NetflixHomeView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI

struct NetflixHomeView: View {
    var onSelectPressed: ((FilterModel) -> Void)? = nil
    @State var selectedFilter: FilterModel? = nil
    var body: some View {
        ZStack {
            Color.netflitBlack.ignoresSafeArea()

            VStack{
                header
                    .padding()

                NetflixFilterBarView(
                    onXmarkPressed: {
                        selectedFilter = nil
                    },
                    onSelectPressed: { filter in
                        selectedFilter = filter
                    },
                    selectedFilter: selectedFilter
                )
                
                Spacer()
            }
           

        }
    }
}

#Preview {
    NetflixHomeView()
}

extension NetflixHomeView {
    var header: some View {
            HStack(spacing: 0) {
                Text("For You")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 16) {
                    Image(systemName: "tv.badge.wifi")
                        .onTapGesture {

                        }
                    Image(systemName: "magnifyingglass")
                        .onTapGesture {

                        }
                }
                .font(.title2)

            }
            .foregroundStyle(.netflixLightGray)

        }
}

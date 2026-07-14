//
//  NetflixFilterBarView.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import SwiftUI

struct NetflixFilterBarView: View {
    var onXmarkPressed: (() -> Void)? = nil
    var onSelectPressed: ((FilterModel) -> Void)? = nil
    var filters: [FilterModel] = FilterModel.mock
    var selectedFilter: FilterModel? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
                    Image(systemName: "xmark")
                        .padding(8)
                        .background(
                            Circle()
                                .stroke()
                        )
                        .foregroundStyle(.netflixLightGray)
                        .onTapGesture {
                            onXmarkPressed?()
                         }
                        .padding(.leading, 16)
                        .transition(.move(edge: .leading))
                }

                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || filter == selectedFilter {
                        NetflixFilterCell(
                            title: filter.title,
                            isDropDown: filter.isDropdown,
                            isSelected: filter == selectedFilter
                        )
                        .background(Color.black.opacity(0.001))
                        .onTapGesture {
                            onSelectPressed?(filter)
                         }
                        .padding(
                            .leading,
                            (filter == filters.first && selectedFilter == nil)
                                ? 16 : 0
                        )
                    }
                }
            }
            .padding(.vertical, 4)
            .animation(.bouncy, value: selectedFilter)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    NetflixFilterBarView()
}

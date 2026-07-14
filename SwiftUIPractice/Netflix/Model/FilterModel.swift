//
//  FilterModel.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 14/07/2026.
//

import Foundation

struct FilterModel: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    
    static var mock:[FilterModel] {
        [
            FilterModel(title: "TV Shows", isDropdown: false),
            FilterModel(title: "Movies", isDropdown: false),
            FilterModel(title: "Category", isDropdown: true),
            
        ]
    }
}

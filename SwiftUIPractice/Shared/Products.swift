//
//  Products.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 10/07/2026.
//

import Foundation

struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let images: [String]
    let thumbnail, category: String
    
    
    var firstImage:String {
        images.first ?? Constants.randomImage
    }
}

struct ProductRow: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let products: [Product]
}

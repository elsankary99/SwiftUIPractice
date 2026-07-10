//
//  DatabaseHelper.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 10/07/2026.
//

import Combine
import Foundation

struct DatabaseHelper {

   static func getProducts() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let productArray = try JSONDecoder().decode(
            ProductArray.self,
            from: data
        )

        return productArray.products
    }
    
    static func getUserss() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let usersArray = try JSONDecoder().decode(
            UsersArray.self,
            from: data
        )

        return usersArray.users
    }
}

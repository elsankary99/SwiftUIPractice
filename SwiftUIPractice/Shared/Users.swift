//
//  Users.swift
//  SwiftUIPractice
//
//  Created by Ahmed Elsankary on 10/07/2026.
//

import Foundation


struct UsersArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    
    static var mock : User {
        return User(
            id: 1,
            firstName: "Ahmed",
            lastName: "Ibrahim",
            maidenName: "_",
            age: 27,
            email: "eeee@gmail.com",
            phone: "0000000",
            username: "@eeee",
            password: "password",
            image: Constants.randomImage,
            height: 180,
            weight: 32
        )
    }
  
}

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
    
    
    var work: String {
        "Worker as Some Job"
    }
    
    var education: String {
        "User Education"
    }
    
    var aboutMe: String {
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
    }
    
    var basics: [USerInterest] {
        return [
            
            USerInterest(iconName: "ruler", emoji: nil, text: "\(height)"),
            USerInterest(iconName: "graduationcap", emoji: nil, text: education),
            USerInterest(iconName: "wineglass", emoji: nil, text: "Socially"),
            USerInterest(iconName: "moon.stars.fill", emoji: nil, text: "Vigro")
        ]
    }
    
    var interests: [USerInterest] {
        return [
            
            USerInterest(iconName: nil, emoji: "👟", text: "Running"),
            USerInterest(iconName: nil, emoji: "🏋🏼‍♂️", text: "Gym"),
            USerInterest(iconName: nil, emoji: "🎧", text: "Music"),
            USerInterest(iconName: nil, emoji: "🥘", text: "Cooking")
        ]
    }
    
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

struct USerInterest: Identifiable {
    let id: String = UUID().uuidString
    let iconName: String?
    let emoji: String?
    let text: String
}

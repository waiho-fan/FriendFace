//
//  User.swift
//  FriendFace
//
//  Created by Gary on 2/1/2025.
//

import Foundation

struct User: Identifiable, Codable {
    var id = UUID()
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    var ageStr: String {
        String(age)
    }
    
    var formatedDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}

struct Friend: Identifiable, Codable {
    var id = UUID()
    var name: String
}

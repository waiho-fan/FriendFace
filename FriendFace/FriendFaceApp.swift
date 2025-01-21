//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Gary on 2/1/2025.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Friend.self])
    }
}

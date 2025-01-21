//
//  ContentView.swift
//  FriendFace
//
//  Created by iOS Dev Ninja on 2/1/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 30))
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.isActive ? "Active" : "Inactive")
                                    .foregroundStyle(user.isActive ? .green : .red)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
            .background(.clear)
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
        }
        .padding()
        .background(.clear)
    }
    
    func loadData() async {
        print("loadData")
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            let decodedUsers = try decoder.decode([User].self, from: data)

            await MainActor.run {
                for user in decodedUsers {
                    modelContext.insert(user)
                    print("modelContext - inserted user")
                }
                try? modelContext.save()
                print("modelContext - inserted saved")

            }
            
            
        } catch {
            print("Invalid Data")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}

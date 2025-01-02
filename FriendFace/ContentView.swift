//
//  ContentView.swift
//  FriendFace
//
//  Created by iOS Dev Ninja on 2/1/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
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
                                Text(user.isActive ? "Active" : "Inacrive")
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
                await loadData()
            }
        }
        .padding()
        .background(.clear)
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let response = try? decoder.decode([User].self, from: data) {
                users = response
                print("Loaded Data - users.count \(users.count)")
            }
        } catch {
            print("Invalid Data")
        }
    }
}

#Preview {
    ContentView()
}

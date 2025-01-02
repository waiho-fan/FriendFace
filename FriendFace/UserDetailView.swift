//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Gary on 3/1/2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        List {
            Section {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 100))
                        Text(user.name)
                            .font(.headline)
                    }
                    Spacer()
                }
            }
            .frame(height: 120)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)

            
            Section("Personal Info") {
                RowView(title: "Age", value: user.ageStr)
                RowView(title: "Registed", value: user.formatedDate)
                RowView(title: "Email", value: user.email)
                RowView(title: "Address", value: user.address)
                RowView(title: "Company", value: user.company)
                RowView(title: "About", value: user.about)
            }
            .listRowSeparator(.hidden)
            
            Section("Tag") {
                FlowLayout(horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(user.tags, id: \.self) { tag in
                        TagView(title: tag)
                    }
                }
            }
            
            Section("Friend") {
                FlowLayout(horizontalSpacing: 10, verticalSpacing: 10) {
                    ForEach(user.friends, id: \.id) { friend in
                        TagView(title: friend.name)
                    }
                }
            }
        }
        
    }
}

#Preview {
    UserDetailView(user: User(isActive: true, name: "Test Name", age: 20, company: "Test Company", email: "Test Email", address: "Test Address", about: "Test About...", registered: .now, tags: [
        "officia",
        "dolor",
        "nisi",
        "exercitation",
        "deserunt",
        "ad",
        "aliquip"
        ],
                              friends: [Friend(name: "Test Friend01"),
                                        Friend(name: "Test Friend02"),
                                        Friend(name: "Test Friend03")]))
}

struct RowView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .padding(.trailing)
            Spacer()
                
            Text(value)
                .font(.subheadline)
        }
    }
}

struct TagView: View {
    var title: String
    var maxWidth: CGFloat = 150
    
    var body: some View {
        ZStack {
            Group {
                Text(title)
                    .font(.headline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .padding(.horizontal, 12)
            }
            .padding(.vertical, 4)
            .frame(maxWidth: maxWidth)
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.primary.opacity(0.1))
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 0.1)
                }
        }
        .fixedSize()
    }
}

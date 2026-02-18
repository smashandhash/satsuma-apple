//
//  NewChatView.swift
//  satsuma
//
//  Created by Gogo on 11/02/26.
//

import SwiftUI

struct NewChatView: View {
    @State var userKeyword: String = ""
    @State private var addedUsers: [String] = []
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Search User", text: $userKeyword)
                List {
                    ForEach(Array(addedUsers).enumerated(), id: \.self) { index, addedUser in
                        NewChatUserAddedView(name: addedUser) {
                            addedUsers.remove(at: index)
                        }
                    }
                }
            }
            .navigationTitle("Create New Chat")
#if !os(macOS)
    .navigationBarTitleDisplayMode(.inline)
#endif
            .toolbar {
                Button {
                    // TODO: Create a new conversation
                } label: {
                    Text("Create Chat")
                }
            }
        }
    }
}

#Preview {
    NewChatView()
}

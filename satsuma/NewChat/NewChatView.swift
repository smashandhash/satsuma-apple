//
//  NewChatView.swift
//  satsuma
//
//  Created by Gogo on 11/02/26.
//

import SwiftUI

struct NewChatView: View {
    @State var userKeyword: String = ""
    @State var addedUsers: [String] = []
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Search User", text: $userKeyword)
                List {
                    ForEach(addedUsers, id: \.self) { addedUser in
                        NewChatUserAddedView(name: addedUser) {
                            // TODO: Remove existing user based on the NPUB instead of the name
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
    NewChatView(userKeyword: "John", addedUsers: ["John", "Smith"])
}

//
//  NewChatView.swift
//  satsuma
//
//  Created by Gogo on 11/02/26.
//

import SwiftUI

struct NewChatView: View {
    @State var userKeyword: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Search User", text: $userKeyword)
                List {
                    // TODO: User added
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

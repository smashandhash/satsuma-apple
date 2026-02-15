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
        Form {
            TextField("Search User", text: $userKeyword)
            List {
                // TODO: User added
            }
        }
        .navigationTitle("Create New Chat")
        .toolbar {
            Button {
                // TODO: Create a new conversation
            } label: {
                Text("Create Chat")
            }
        }
    }
}

#Preview {
    NewChatView()
}

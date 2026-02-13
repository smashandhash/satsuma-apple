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
    }
}

#Preview {
    NewChatView()
}

//
//  NewChatUserAddedView.swift
//  satsuma
//
//  Created by Gogo on 18/02/26.
//

import SwiftUI

struct NewChatUserAddedView: View {
    @State var name: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(name)
            
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
            }
        }
    }
}

#Preview {
    NewChatUserAddedView(name: "John", action: {print("Something")})
}

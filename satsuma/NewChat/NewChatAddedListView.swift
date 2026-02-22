//
//  NewChatAddedListView.swift
//  satsuma
//
//  Created by Gogo on 22/02/26.
//

import SwiftUI

struct NewChatAddedListView: View {
    @State var addedList: [String] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(addedList, id: \.self) { user in
                    NewChatUserAddedView(name: user) {
                        // TODO: Do something
                    }
                }
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    NewChatAddedListView(addedList: ["John", "Smith"])
}

//
//  SingleDirectMessageView.swift
//  satsuma
//
//  Created by Gogo on 25/12/25.
//

import SwiftUI

struct SingleDirectMessageView: View {
    let message: NostrDirectMessage
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: URL(string: message.senderImage))
                .frame(width: 50, height: 50)
            
            NavigationLink {
                ThreadsView(threads: message.threads)
            } label: {
                VStack(spacing: 10) {
                    Text(message.senderName)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(message.threads.last?.content.content ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
}

#Preview {
    SingleDirectMessageView(message: NostrDirectMessage.example)
}

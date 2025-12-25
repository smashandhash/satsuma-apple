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
            
            VStack(spacing: 10) {
                Text(message.senderName)
                    .fontWeight(.bold)
                
                Text(message.threads.last?.content ?? "")
            }
        }
    }
}

#Preview {
    SingleDirectMessageView(message: NostrDirectMessage(senderKey: "Sender Key", senderImage: "Sender's Image", senderName: "Sender Name", threads: Array(repeating: NostrThread(id: UUID(), senderKey: "Another Sender Key", senderName: "Sender Name", senderImage: "Sender Image", content: "Must be the content.", imageContent: nil), count: 10)))
}

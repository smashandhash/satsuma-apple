//
//  DirectMessagesView.swift
//  satsuma
//
//  Created by Gogo on 25/12/25.
//

import SwiftUI

struct DirectMessagesView: View {
    let messages: [NostrDirectMessage]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(messages) { message in
                        SingleDirectMessageView(message: message)
                    }
                }
            }
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .navigationTitle("DMs")
        }
    }
}

#Preview {
    DirectMessagesView(messages: Array(repeating: NostrDirectMessage.example, count: 20))
}

struct NostrDirectMessage: Identifiable {
    let id: UUID
    let senderKey: String
    let senderImage: String
    let senderName: String
    let threads: [NostrThread]
    
    static let example = NostrDirectMessage(id: UUID(), senderKey: "Sender Key", senderImage: "Sender's Image", senderName: "Sender Name", threads: Array(repeating: NostrThread.exampleWithoutReplies, count: 10))
}

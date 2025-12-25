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
                    SingleDirectMessageView()
                }
            }
        }.navigationTitle("DMs")
    }
}

#Preview {
    DirectMessagesView(messages: Array(repeating: NostrDirectMessage(senderKey: "Sender Key", senderImage: "Sender's Image", senderName: "Sender Name", threads: Array(repeating: NostrThread(id: UUID(), senderKey: "Another Sender Key", senderName: "Sender Name", senderImage: "Sender Image", content: "Must be the content.", imageContent: nil), count: 10)), count: 20))
}

struct NostrDirectMessage {
    let senderKey: String
    let senderImage: String
    let senderName: String
    let threads: [NostrThread]
}

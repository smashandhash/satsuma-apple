//
//  DirectMessagesView.swift
//  satsuma
//
//  Created by Gogo on 25/12/25.
//

import SwiftUI

struct DirectMessagesView: View {
    let messages: [NostrDirectMessage]
    @State private var existingDraft: String = ""
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack {
                if messages.isEmpty {
                    EmptyStateView(originState: .DMs)
                } else {
                    VStack {
                        ScrollView {
                            VStack(spacing: 10) {
                                ForEach(messages) { message in
                                    SingleDirectMessageView(message: message)
                                }
                            }
                        }
                    }
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(.orange)
                        .foregroundStyle(.white)
                        .clipShape(Circle())
                }
                .padding()
            }
        }
    }
    
    func sendMessage() {
        // TODO: Send Nostr
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

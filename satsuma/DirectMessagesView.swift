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
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                if messages.isEmpty {
                    EmptyStateView(originState: .DMs)
                        .frame(maxHeight: .infinity)
                } else {
                    List {
                        ForEach(messages) { message in
                            SingleDirectMessageView(message: message)
                        }
                    }
                    .refreshable {
                        loadMessage()
                    }
                    .onAppear {
                        UIRefreshControl.appearance().tintColor = .orange
                    }
                }
                
                NavigationLink {
                    NewChatView()
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
    
    func loadMessage() {
        // TODO: Get from Nostr
    }
    
    func newMessage() {
        // TODO: Create new message to new sender
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

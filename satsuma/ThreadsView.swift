//
//  ThreadsView.swift
//  satsuma
//
//  Created by Gogo on 20/12/25.
//

import SwiftUI

struct ThreadsView: View {
    @State private var previousContent: NostrContent? = nil
    @State var threads: [NostrThread] = []
    @State var textDraft: String = ""
    
    var body: some View {
        VStack(spacing: 5) {
            ScrollView(.vertical) {
                VStack(spacing: 5) {
                    ForEach(threads) { thread in
                        NavigationLink {
                            RepliesView(thread: thread)
                        } label: {
                            SingleThreadOrReplyView(content: thread.content, existingPreviousContent: $previousContent)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            
            TextField("", text: $textDraft)
                .onSubmit {
                    // TODO: Send Nostr
                }
                .border(.black)
                .padding()
        }
    }
}

#Preview {
    ThreadsView(threads: Array(repeating: NostrThread.exampleWithoutReplies, count: 100))
}

struct NostrThread: Hashable, Identifiable {
    let id: UUID
    let content: NostrContent
    let replies: [NostrReply]
    
    static let exampleWithoutReplies = NostrThread(id: UUID(), content: NostrContent.example, replies: [])
    static let exampleWithReplies = NostrThread(id: UUID(), content: NostrContent.example, replies: Array.init(repeating: NostrReply.example, count: 20))
}

struct NostrContent: Hashable {
    let senderKey: String
    let senderName: String
    let senderImage: String
    let content: String
    let imageContent: String?
    
    static let example = NostrContent(senderKey: "Key", senderName: "Sender's Name", senderImage: "Sender's Image", content: "This is a content \nThat's another content", imageContent: nil)
}

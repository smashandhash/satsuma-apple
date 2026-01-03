//
//  RepliesView.swift
//  satsuma
//
//  Created by Gogo on 30/12/25.
//

import SwiftUI

struct RepliesView: View {
    @State private var previousContent: NostrContent?
    @State var thread: NostrThread
    @State var existingDraft: String = ""
    
    var body: some View {
        VStack(spacing: 5) {
            ScrollView {
                VStack(spacing: 10) {
                    SingleThreadOrReplyView(content: thread.content)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(thread.replies) { reply in
                        SingleThreadOrReplyView(content: reply.content, existingPreviousContent: $previousContent)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            
            TextField("", text: $existingDraft)
                .onSubmit {
                    // TODO: Send Nostr
                }
                .border(.black)
                .padding()
        }
    }
}

#Preview {
    RepliesView(thread: NostrThread.exampleWithReplies)
}

struct NostrReply: Hashable, Identifiable {
    let id: UUID
    let content: NostrContent
    
    static let example = NostrReply(id: UUID(), content: NostrContent.example)
}

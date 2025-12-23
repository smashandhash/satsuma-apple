//
//  ThreadsView.swift
//  satsuma
//
//  Created by Gogo on 20/12/25.
//

import SwiftUI

struct ThreadsView: View {
    @State private var previousSenderKey = "Key"
    @State private var isSameAsPreviousSender = false
    @State var threads: [NostrThread] = []
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 5) {
                ForEach(threads) { thread in
                    SingleThreadView(thread: thread, isSameAsPreviousSender: $isSameAsPreviousSender)
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    ThreadsView(threads: Array(repeating: NostrThread(id: UUID(), senderKey: "Key", senderName: "Sender's Name", senderImage: "Sender's Image", content: "This is a content \nThat's another content", imageContent: nil), count: 100))
}

struct NostrThread: Hashable, Identifiable {
    let id: UUID
    let senderKey: String
    let senderName: String
    let senderImage: String
    let content: String
    let imageContent: String?
}

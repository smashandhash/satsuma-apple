//
//  ThreadsView.swift
//  satsuma
//
//  Created by Gogo on 20/12/25.
//

import SwiftUI

struct ThreadsView: View {
    @State var threads: [NostrThread] = []
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(threads) { thread in
                SingleThreadView(thread: thread)
            }
        }
    }
}

#Preview {
    ThreadsView()
}

struct NostrThread: Identifiable {
    let id: UUID
    let senderName: String
    let senderImage: String
    let content: String
    let imageContent: String?
}

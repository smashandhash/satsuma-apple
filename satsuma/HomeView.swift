//
//  HomeView.swift
//  satsuma
//
//  Created by Gogo on 19/12/25.
//

import SwiftUI

struct HomeView: View {
    @State var channels: [NostrChannel]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(channels) { channel in
                        NavigationLink(channel.channelName, value: channel.threads)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }.navigationDestination(for: NostrChannel.self) { channel in
                    ThreadsView(threads: channel.threads)
                }.padding()
            }
            #if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Text("W")
                    }
                }
        }
    }
}

#Preview {
    HomeView(channels: Array(repeating: NostrChannel(id: UUID(), channelName: "# general", threads: Array(repeating: NostrThread(id: UUID(), content: NostrContent(senderKey: "Key", senderName: "Sender's Name", senderImage: "Sender's Image", content: "Wow, a content.\nWonder it's real.", imageContent: nil), replies: []), count: 100)), count: 100))
}

struct NostrChannel: Hashable, Identifiable {
    let id: UUID
    let channelName: String
    let threads: [NostrThread]
}

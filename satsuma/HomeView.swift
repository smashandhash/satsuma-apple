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
            ZStack {
                LinearGradient(stops: [
                    .init(color: .orange, location: 0),
                    .init(color: .white, location: 0.2)
                ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
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
            }
        }
    }
}

#Preview {
    HomeView(channels: Array(repeating: NostrChannel.example, count: 100))
}

struct NostrChannel: Hashable, Identifiable {
    let id: UUID
    let channelName: String
    let threads: [NostrThread]
    
    static let example = NostrChannel(id: UUID(), channelName: "# general", threads: Array(repeating: NostrThread.exampleWithoutReplies, count: 100))
}

//
//  MainView.swift
//  satsuma
//
//  Created by Gogo on 18/12/25.
//

import SwiftUI

struct MainView: View {
    @State private var currentTab: Tabs = .Home
    @State var channels: [NostrChannel] = []
    @State var messages: [NostrDirectMessage] = []
    
    var body: some View {
        TabView(selection: $currentTab) {
            Tab("Home", systemImage: "house", value: .Home) {
                HomeView(channels: channels)
                    .padding()
            }
            
            Tab("DMs", systemImage: "bubble", value: .DMs) {
                DirectMessagesView(messages: messages)
            }
            
            Tab("Activity", systemImage: "bell", value: .Activity) {
                Text("This is Activity page")
            }
        }.tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    MainView(channels: Array(repeating: NostrChannel(id: UUID(), channelName: "# general", threads: Array(repeating: NostrThread(id: UUID(), senderKey: "Key", senderName: "Sender's Name", senderImage: "Sender's Image", content: "Wow, a content.\nWonder it's real.", imageContent: nil), count: 100)), count: 100), messages: Array(repeating: NostrDirectMessage(id: UUID(), senderKey: "Sender Key", senderImage: "Sender's Image", senderName: "Sender Name", threads: Array(repeating: NostrThread(id: UUID(), senderKey: "Another Sender Key", senderName: "Sender Name", senderImage: "Sender Image", content: "Must be the content.", imageContent: nil), count: 10)), count: 20))
}

enum Tabs: Equatable, Hashable {
    case Home
    case DMs
    case Activity
    case Search
}

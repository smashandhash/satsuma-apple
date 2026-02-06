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
    @State var activities: [NostrActivity] = []
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentTab) {
                Tab("Home", systemImage: "house", value: .Home) {
                    HomeView(channels: channels)
                        .padding(.bottom)
                }
                
                Tab("DMs", systemImage: "bubble", value: .DMs) {
                    DirectMessagesView(messages: messages)
                        .padding()
                }
                
                Tab("Activity", systemImage: "bell", value: .Activity) {
                    ActivitiesView(activities: activities)
                        .padding()
                }
            }
            .tabViewStyle(.sidebarAdaptable)
#if !os(macOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
            .navigationTitle(currentTab.rawValue)
        }
    }
}

#Preview {
    MainView(channels: Array(
        repeating: NostrChannel.example,
        count: 100),
             messages: Array(
                repeating: NostrDirectMessage.example,
                count: 20),
             activities: Array(
                repeating: NostrActivity.example,
                count: 20))
}

enum Tabs: String, Equatable, Hashable {
    case Home = "Home"
    case DMs = "DMs"
    case Activity = "Activities"
    case Search = "Search"
}

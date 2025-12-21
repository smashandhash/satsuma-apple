//
//  HomeView.swift
//  satsuma
//
//  Created by Gogo on 19/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var channels = [String]()
    
    var body: some View {
        NavigationStack(path: $channels) {
            VStack(alignment: .leading, spacing: 10) {
                ChannelView(channelName: "general") {
                    channels = ["general"]
                }
                ChannelView(channelName: "all") {
                    channels.append("all")
                }
            }.navigationDestination(for: String.self) { channel in
                Text("You're at the Channel named \(channel).")
            }
        }
    }
}

#Preview {
    HomeView()
}

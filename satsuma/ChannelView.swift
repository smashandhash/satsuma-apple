//
//  ChannelView.swift
//  satsuma
//
//  Created by Gogo on 19/12/25.
//

import SwiftUI

struct ChannelView: View {
    @State var channelName = "channel-name"
    @State var action: (() -> Void)?
    
    var body: some View {
        HStack {
            Image(systemName: "leaf")
            
            Text(channelName)
        }
    }
}

#Preview {
    ChannelView()
}

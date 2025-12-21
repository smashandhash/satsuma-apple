//
//  ChannelView.swift
//  satsuma
//
//  Created by Gogo on 19/12/25.
//

import SwiftUI

struct ChannelView: View {
    let channelName: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "leaf")
                    .tint(.gray)
                
                Text(channelName)
                    .tint(.black)
            }
        }
    }
}

#Preview {
    ChannelView(channelName: "Test", action: { print("Test pressed") })
}

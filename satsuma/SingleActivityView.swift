//
//  SingleActivityView.swift
//  satsuma
//
//  Created by Gogo on 28/12/25.
//

import SwiftUI

struct SingleActivityView: View {
    @State var activity: NostrActivity
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: activity.thread.senderImage))
            
            VStack {
                Text(activity.thread.senderName)
                
                Text(activity.thread.content)
            }
        }
    }
}

#Preview {
    SingleActivityView(activity: NostrActivity(id: UUID(), thread: NostrThread(id: UUID(), senderKey: "Sender's Key", senderName: "Sender Name", senderImage: "Sender's Image", content: "Here's a content.", imageContent: nil)))
}

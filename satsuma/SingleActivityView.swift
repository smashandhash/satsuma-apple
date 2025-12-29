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
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: activity.thread.senderImage))
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(activity.thread.senderName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                
                Text(activity.thread.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: false)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    SingleActivityView(activity: NostrActivity(id: UUID(), thread: NostrThread(id: UUID(), senderKey: "Sender's Key", senderName: "Sender Name", senderImage: "Sender's Image", content: "Here's a content.\nAnother one.\nCan't get one.", imageContent: nil)))
}

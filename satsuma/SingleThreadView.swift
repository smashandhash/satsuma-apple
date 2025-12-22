//
//  SingleThreadView.swift
//  satsuma
//
//  Created by Gogo on 22/12/25.
//

import SwiftUI

struct SingleThreadView: View {
    @State var thread: NostrThread
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                AsyncImage(url: URL(string: thread.senderImage))
                Text(thread.senderName)
            }
            
            Text(thread.content)
                .fixedSize(horizontal: false, vertical: true)
            
            if let imageContent = thread.imageContent {
                AsyncImage(url: URL(string: imageContent))
            }
        }
    }
}

#Preview {
    SingleThreadView(thread: NostrThread(id: UUID(), senderName: "Sender's name", senderImage: "Image", content: "This is content.", imageContent: nil))
}

//
//  SingleThreadView.swift
//  satsuma
//
//  Created by Gogo on 22/12/25.
//

import SwiftUI

struct SingleThreadView: View {
    @State var thread: NostrThread
    @Binding var isSameAsPreviousSender: Bool
    
    var body: some View {
        
        HStack(spacing: 10) {
            if !isSameAsPreviousSender {
                AsyncImage(url: URL(string: thread.senderImage))
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading, spacing: 10) {
                if !isSameAsPreviousSender {
                    Text(thread.senderName)
                        .fontWeight(.bold)
                        .frame(alignment: .leading)
                }
                
                Text(thread.content)
                    .fixedSize(horizontal: false, vertical: true)
                
                if let imageContent = thread.imageContent {
                    AsyncImage(url: URL(string: imageContent))
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var isSameAsPreviousSender = true
    
    SingleThreadView(thread: NostrThread(id: UUID(), senderKey: "Key", senderName: "Sender's name", senderImage: "Image", content: "This is content.", imageContent: nil), isSameAsPreviousSender: $isSameAsPreviousSender)
}

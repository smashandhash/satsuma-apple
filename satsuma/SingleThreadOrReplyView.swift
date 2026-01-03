//
//  SingleThreadOrReplyView.swift
//  satsuma
//
//  Created by Gogo on 22/12/25.
//

import SwiftUI

struct SingleThreadOrReplyView: View {
    @State var content: NostrContent
    @Binding var existingPreviousContent: NostrContent?
    
    init(content: NostrContent, existingPreviousContent: Binding<NostrContent?>? = nil) {
        self.content = content
        self._existingPreviousContent = existingPreviousContent ?? Binding.constant(nil)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            if content.senderKey != existingPreviousContent?.senderKey {
                AsyncImage(url: URL(string: content.senderImage))
                    .frame(width: 50, height: 50)
            } else {
                Spacer()
                    .frame(width: 50, height: 50)
            }
            VStack(alignment: .leading, spacing: 10) {
                if content.senderKey != existingPreviousContent?.senderKey {
                    Text(content.senderName)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Text(content.content)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if let imageContent = content.imageContent {
                    AsyncImage(url: URL(string: imageContent))
                }
            }
        }.task {
            existingPreviousContent = content
        }
    }
}

#Preview {
    @Previewable var previousContent: Binding<NostrContent?>? = Binding.constant(NostrContent.example)
    
    SingleThreadOrReplyView(content: NostrContent.example, existingPreviousContent: previousContent)
}

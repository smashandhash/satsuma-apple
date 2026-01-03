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
            AsyncImage(url: URL(string: activity.thread.content.senderImage))
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(activity.thread.content.senderName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                
                Text(activity.thread.content.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: true, vertical: false)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    SingleActivityView(activity: NostrActivity.example)
}

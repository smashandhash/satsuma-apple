//
//  ActivitiesVIew.swift
//  satsuma
//
//  Created by Gogo on 28/12/25.
//

import SwiftUI

struct ActivitiesVIew: View {
    @State var activities: [NostrActivity]
    
    var body: some View {
        if activities.isEmpty {
            EmptyActivitiesView()
        } else {
            NavigationStack {
                ScrollView {
                    ForEach(activities) { activity in
                        NavigationLink {
                            // TODO: Not sure this is a proper implementation to load a Thread or Replies
                            ThreadsView(threads: [activity.thread])
                        } label: {
                            SingleActivityView(activity: activity)
                        }
                    }
                }
#if !os(macOS)
                .navigationBarTitleDisplayMode(.inline)
#endif
                .navigationTitle("Activities")
            }
        }
    }
}

#Preview {
    ActivitiesVIew(activities: Array(repeating: NostrActivity(id: UUID(), thread: NostrThread(id: UUID(), content: NostrContent(senderKey: "Sender's Key", senderName: "Sender Name", senderImage: "Sender's Image", content: "Here's a content.", imageContent: nil), replies: [])), count: 20))
}

struct NostrActivity: Identifiable {
    let id: UUID
    let thread: NostrThread
}

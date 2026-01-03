//
//  ActivitiesView.swift
//  satsuma
//
//  Created by Gogo on 28/12/25.
//

import SwiftUI

struct ActivitiesView: View {
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
    ActivitiesView(activities: Array(repeating: NostrActivity.example, count: 20))
}

struct NostrActivity: Identifiable {
    let id: UUID
    let thread: NostrThread
    
    static let example = NostrActivity(id: UUID(), thread: NostrThread.exampleWithoutReplies)
}

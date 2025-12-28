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
        ForEach(activities) { activity in
            SingleActivityView(activity: activity)
        }
    }
}

#Preview {
    ActivitiesVIew(activities: Array(repeating: NostrActivity(id: UUID(), thread: NostrThread(id: UUID(), senderKey: "Sender's Key", senderName: "Sender Name", senderImage: "Sender's Image", content: "Here's a content.", imageContent: nil)), count: 20))
}

struct NostrActivity: Identifiable {
    let id: UUID
    let thread: NostrThread
    // TODO: Add Reply Struct later
}

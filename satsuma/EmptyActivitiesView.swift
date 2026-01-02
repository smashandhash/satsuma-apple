//
//  EmptyActivitiesView.swift
//  satsuma
//
//  Created by Gogo on 02/01/26.
//

import SwiftUI

struct EmptyActivitiesView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: "wind")
                .frame(width: 50, height: 50)
            
            Text("No activities going on lately.")
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    EmptyActivitiesView()
}

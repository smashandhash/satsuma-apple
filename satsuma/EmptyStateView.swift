//
//  EmptyStateView.swift
//  satsuma
//
//  Created by Gogo on 02/01/26.
//

import SwiftUI

struct EmptyStateView: View {
    let originState: EmptyState
    private var imageName: String {
        switch originState {
        case .Activities:
            "wind"
        case .DMs:
            "envelope"
        }
    }
    private var textDescription: String {
        switch originState {
        case .Activities:
            "No activities going on lately."
        case .DMs:
            "No DMs received lately."
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .frame(width: 50, height: 50)
            
            Text(textDescription)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    EmptyStateView(originState: .Activities)
}

enum EmptyState {
    case Activities
    case DMs
}

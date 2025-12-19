//
//  MainView.swift
//  satsuma
//
//  Created by Gogo on 18/12/25.
//

import SwiftUI

struct MainView: View {
    @State private var currentTab: Tabs = .Home
    
    var body: some View {
        TabView(selection: $currentTab) {
            Tab("Home", systemImage: "house", value: .Home) {
                HomeView()
            }
            
            Tab("DMs", systemImage: "bubble", value: .DMs) {
                Text("This is DMs page")
            }
            
            Tab("Activity", systemImage: "bell", value: .Activity) {
                Text("This is Activity page")
            }
        }.tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    MainView()
}

enum Tabs: Equatable, Hashable {
    case Home
    case DMs
    case Activity
    case Search
}

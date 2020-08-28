//
//  MainNavigationView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI

struct MainNavigationView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif

    @Binding var selectedSection: SectionIdentifier

    var body: some View {
        if horizontalSizeClass == .compact {
            TabNavigationView(selectedSection: $selectedSection)
        } else {
            NavigationView {
                SidebarNavigationView(selectedSection: $selectedSection)

                ItemListView()

                Text("Choose a talk to watch").font(.largeTitle)
            }
        }
    }
}

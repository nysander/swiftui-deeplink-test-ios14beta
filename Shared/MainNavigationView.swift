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

    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            TabNavigationView()
        } else {
            NavigationView {
                SidebarNavigationView()

                ItemListView()

                Text("Choose a talk to watch").font(.largeTitle)
            }
        }
        #elseif os(macOS)
        NavigationView {
            SidebarNavigationView()

            ItemListView()

            Text("Choose a talk to watch").font(.largeTitle)
        }
        #endif
    }
}

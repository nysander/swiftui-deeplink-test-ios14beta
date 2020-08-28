//
//  ios14testApp.swift
//  Shared
//
//  Created by Pawel Madej on 20/08/2020.
//

import SwiftUI

@main
struct ios14testApp: App {
    @State var selectedSection: SectionIdentifier = .talks

    @SceneBuilder
    var body: some Scene {
        WindowGroup {
            MainNavigationView(selectedSection: $selectedSection)
        }
    }
}

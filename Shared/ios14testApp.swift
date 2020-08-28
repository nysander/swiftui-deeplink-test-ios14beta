//
//  ios14testApp.swift
//  Shared
//
//  Created by Pawel Madej on 20/08/2020.
//

import SwiftUI

@main
struct ios14testApp: App {
    @StateObject var model = ItemViewModel()

    var body: some Scene {
        WindowGroup {
            MainNavigationView()
                .environmentObject(model)
        }
    }
}

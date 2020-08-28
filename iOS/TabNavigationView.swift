//
//  TabNavigationView.swift
//  Shared
//
//  Created by Pawel Madej on 20/08/2020.
//

import SwiftUI

struct TabNavigationView: View {
    @State var selectedSection: SectionIdentifier = .talks

    @State var optionalSection: SectionIdentifier? = .talks {
        willSet {
            if let newValue = newValue {
                selectedSection = newValue
            }
        }
    }
    
    var body: some View {
        TabView(selection: $selectedSection) {
            NavigationView {
                ItemListView(selectedSection: $optionalSection)
            }
            .tabItem {
                Image(systemName: SectionIdentifier.talks.icon)
                Text(verbatim: SectionIdentifier.talks.title)
            }
            .tag(SectionIdentifier.talks)

            NavigationView {
                SpeakerView()
            }
            .tabItem {
                Image(systemName: SectionIdentifier.speakers.icon)
                Text(verbatim: SectionIdentifier.speakers.title)
            }
            .tag(SectionIdentifier.speakers)
        }
        .onOpenURL { url in
            selectedSection = url.sectionIdentifier!
        }
    }
}


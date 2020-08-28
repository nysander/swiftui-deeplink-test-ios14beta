//
//  SidebarNavigationView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI

struct SidebarNavigationView: View {
    @State var selectedSection: SectionIdentifier? = .talks

    var body: some View {
        List {
            NavigationLink(
                destination: ItemListView(),
                tag: SectionIdentifier.talks,
                selection: $selectedSection) {
                Label(SectionIdentifier.talks.title, systemImage: SectionIdentifier.talks.icon)
            }

            NavigationLink(
                destination: SpeakerView(),
                tag: SectionIdentifier.speakers,
                selection: $selectedSection) {
                Label(SectionIdentifier.speakers.title, systemImage: SectionIdentifier.speakers.icon)
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem {
                Menu("Select Item") {
                    Button("Select Talks tab") {
                        UIApplication.shared.open(URL(string: "testlink://talks")!, options: [:], completionHandler: nil)
                    }
                    Button("Select Speakers tab") {
                        UIApplication.shared.open(URL(string: "testlink://speakers")!, options: [:], completionHandler: nil)
                    }
                    Button("Select 5th item") {
                        UIApplication.shared.open(URL(string: "testlink://talks/86af4777-aba8-416c-a543-e0a3cc15e708")!, options: [:], completionHandler: nil)
                    }
                    Button("Select 75th item") {
                        UIApplication.shared.open(URL(string: "testlink://talks/9eb06f79-2c0b-4c83-aa9b-845807d21ebe")!, options: [:], completionHandler: nil)
                    }
                }
            }
        }
        .onOpenURL { url in
            selectedSection = url.sectionIdentifier
        }
    }
}

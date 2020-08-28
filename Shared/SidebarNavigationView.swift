//
//  SidebarNavigationView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI

struct SidebarNavigationView: View {
    @Binding var selectedSection: SectionIdentifier

    @State var selection: SectionIdentifier?

    func switchSelection(_ selection: SectionIdentifier?) {
        if let selection = selection {
            selectedSection = selection
        }
    }

    @ViewBuilder
    var body: some View {
        List(selection: $selection.onChange(switchSelection)) {
            NavigationLink(
                destination: ItemListView(),
                tag: SectionIdentifier.talks,
                selection: $selection) {
                Label(SectionIdentifier.talks.title, systemImage: SectionIdentifier.talks.icon)
            }

            NavigationLink(
                destination: SpeakerView(),
                tag: SectionIdentifier.speakers,
                selection: $selection) {
                Label(SectionIdentifier.speakers.title, systemImage: SectionIdentifier.speakers.icon)
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    //
                }) {
                    Image(systemName: "gear")
                        .keyboardShortcut("s", modifiers: .command)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "person")
                    .keyboardShortcut("p", modifiers: .command)
            }
        }
    }
}

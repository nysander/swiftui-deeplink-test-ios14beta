//
//  TabNavigationView.swift
//  Shared
//
//  Created by Pawel Madej on 20/08/2020.
//

import SwiftUI

struct TabNavigationView: View {
    @State var selectedSection: SectionIdentifier = .speakers
    
    var body: some View {
        TabView(selection: $selectedSection) {
            ItemListView()
                .tabItem {
                    Image(systemName: SectionIdentifier.talks.icon)
                    Text(verbatim: SectionIdentifier.talks.title)
                }
                .tag(SectionIdentifier.talks)

            SpeakerView()
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


struct ItemListView: View {
    @StateObject var model = ItemViewModel()

    @State var activeUUID: UUID?

    var body: some View {
        NavigationView {
            ScrollViewReader { scrollProxy in
                List {
                    ForEach(model.items) { item in
                        NavigationLink(destination: DetailView(item: item),
                                       tag: item.id,
                                       selection: $activeUUID) {
                            Text("\(item.name) \(item.id)")
                                .font(.caption)
                        }
                        .id(item.id)
                    }
                }
                .onOpenURL { url in
                    if case .talk(let id) = url.detailPage {
                        scrollProxy.scrollTo(id)
                        activeUUID = id
                    }
                }
            }
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
        }
    }
}

struct DetailView: View {
    var item: Item

    var body: some View {
        VStack {
            Text("\(item.id)")
            Text("\(item.name)")
        }
    }
}

struct SpeakerView: View {
    var body: some View {
        NavigationView {
            Text("speakers")
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
        }
    }
}

struct Item: Identifiable {
    var id = UUID()
    var name: Int
}

class ItemViewModel: ObservableObject {
    var fifthID = "86af4777-aba8-416c-a543-e0a3cc15e708"
    var seventyFifthID = "9eb06f79-2c0b-4c83-aa9b-845807d21ebe"
    
    @Published var items: [Item] = []

    init() {
        var items: [Item] = []
        for x in 1...500 {
            if x == 5 {
                items.append(Item(id: UUID(uuidString: fifthID)!, name: x))
            } else if x == 75 {
                items.append(Item(id: UUID(uuidString: seventyFifthID)!, name: x))
            } else {
                items.append(Item(name: x))
            }
        }
        self.items = items
    }
}

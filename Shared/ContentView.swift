//
//  ContentView.swift
//  Shared
//
//  Created by Pawel Madej on 20/08/2020.
//

import SwiftUI

struct ContentView: View {
    @Binding var selectedSection: SectionIdentifier?
    
    var body: some View {
        TabView(selection: $selectedSection) {
            ItemListView()
                .tabItem {
                    Image(systemName: SectionIdentifier.talks.icon)
                    Text(verbatim: SectionIdentifier.talks.title)
                }
                .tag(SectionIdentifier.talks)

            Text("speakers")
                .tabItem {
                    Image(systemName: SectionIdentifier.speakers.icon)
                    Text(verbatim: SectionIdentifier.speakers.title)
                }
                .tag(SectionIdentifier.speakers)
        }
        .onOpenURL { url in
            selectedSection = url.sectionIdentifier
            print(selectedSection?.title)
        }
        .onAppear {
            print(selectedSection?.title)
        }
    }
}


struct ItemListView: View {
    @StateObject var model = ItemViewModel()
//    @Binding var selectedSection: SectionIdentifier?

    @State var activeUUID: UUID?
    var body: some View {
        NavigationView {
            ScrollViewReader { scrollProxy in
                List {//}(selection: $activeUUID) {
                    Button(action: {
                        //                    selectedSection = .speakers
                    }) {
                        Text("speakers")
                    }
                    ForEach(model.items) { item in
                        NavigationLink(destination: DetailView(item: item), tag: item.id, selection: $activeUUID) {
                            Text("\(item.name) \(item.id)").font(.caption)
                            
                            //                    .id(item.id)
                            
                        }
                        .id(item.id)
                        .onAppear {
                            //                        print(item.id.uuidString)
                        }
                    }
                }
                .onOpenURL { url in
                    if case .talk(let id) = url.detailPage {
                        print(id.uuidString)
                        scrollProxy.scrollTo(id)
                        activeUUID = id
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Menu("Select Item") {
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

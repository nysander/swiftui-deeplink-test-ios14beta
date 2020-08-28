//
//  ItemListView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI

struct ItemListView: View {
    @StateObject var model = ItemViewModel()

    @State var activeUUID: UUID?

    var body: some View {
            ScrollViewReader { scrollProxy in
                List {
                    ForEach(model.items) { item in
                        NavigationLink(destination: ItemDetailView(item: item),
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

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}

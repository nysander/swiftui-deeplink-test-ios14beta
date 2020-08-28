//
//  ItemViewModel.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import Foundation

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

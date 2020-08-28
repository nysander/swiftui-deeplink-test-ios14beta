//
//  ItemDetailView.swift
//  ios14test
//
//  Created by Pawel Madej on 28/08/2020.
//

import SwiftUI


struct ItemDetailView: View {
    var item: Item

    var body: some View {
        VStack {
            Text("\(item.id)")
            Text("\(item.name)")
        }
    }
}

//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView()
//    }
//}

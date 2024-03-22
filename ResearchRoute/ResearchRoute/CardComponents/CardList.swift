//
//  CardList.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct CardList<T: Hashable>: View {
    let items: [T]
    let component: (T) -> Card
    
    init(_ items: [T], component: @escaping (T) -> Card) {
        self.items = items
        self.component = component
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(items, id: \.self) { item in
                    component(item)
                }
            }
        }
    }
}

#Preview {
    CardList(["1", "2"]) { item in
        Card(post: ResearchPostModel(title: "Research Position", faculty: ["Sam King"]), appliedDate: nil)
    }
}

//
//  Section.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionList<T: Hashable, V: View>: View {
    let title: String
    let content: [T]
    let component: (T) -> SectionListItem<V>
    
    var body: some View {
        VStack {
            LeftAlign {
                HStack {
                    SectionTitle(title)
                    
                    Image(systemName: "plus")
                        .imageScale(.medium)
                        .foregroundStyle(titleColor)
                }
            }
            
            ForEach(content, id: \.self) { item in
                component(item)
            }
        }
    }
}

#Preview {
    SectionList(title: "List", content: ["1", "2", "3"]) { item in
        SectionListItem("Item") {
            LeftAlign {
                Text(item)
            }
        }
    }
}

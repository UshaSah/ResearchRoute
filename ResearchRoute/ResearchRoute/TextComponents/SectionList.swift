//
//  Section.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionList<T: Hashable, V: View, W: View>: View {
    let title: String
    let content: [T]
    let destination: W
    let component: (T) -> SectionListItem<V>
    
    var body: some View {
        VStack {
            LeftAlign {
                HStack {
                    SectionTitle(title)
                    
                    NavigationLink(destination: destination) {
                        Image(systemName: "square.and.pencil")
                            .imageScale(.medium)
                            .foregroundStyle(titleColor)
                    }
                }
            }
            
            ForEach(content, id: \.self) { item in
                component(item)
            }
        }
    }
}

#Preview {
    SectionList(title: "List", content: ["1", "2", "3"], destination: EmptyView()) { item in
        SectionListItem("Item") {
            LeftAlign {
                Text(item)
            }
        }
    }
}

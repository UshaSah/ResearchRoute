//
//  SectionListItem.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionListItem<T: View>: View {
    let subtitle: String
    let component: () -> T
    
    init(_ subtitle: String, component: @escaping () -> T) {
        self.subtitle = subtitle
        self.component = component
    }
    
    var body: some View {
        VStack {
            LeftAlign {
                HStack {
                    SectionSubtitle(subtitle)
                    
                    Image(systemName: "square.and.pencil")
                        .imageScale(.medium)
                        .foregroundStyle(titleColor)
                }
            }
            
            component()
        }
    }
}

#Preview {
    SectionListItem("List Item") {
        Text("Subitem")
    }
}

//
//  SectionTitle.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionSubtitle: View {
    let subtitle: String
    
    init(_ subtitle: String) {
        self.subtitle = subtitle
    }
    
    var body: some View {
        Text(subtitle)
            .font(.custom(Font.subtitleName, size: Font.subtitleSize))
            .foregroundStyle(Font.subtitleColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    SectionSubtitle("Subtitle")
}

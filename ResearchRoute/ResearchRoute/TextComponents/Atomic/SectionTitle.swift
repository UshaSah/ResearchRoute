//
//  SectionTitle.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.custom(Font.titleName, size: Font.titleSize))
            .foregroundStyle(Font.titleColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    SectionTitle("Title")
}

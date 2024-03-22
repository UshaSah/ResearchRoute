//
//  SectionTitle.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SuperTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.custom(Font.superTitleName, size: Font.superTitleSize))
            .foregroundStyle(Font.superTitleColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    SuperTitle("Title")
}

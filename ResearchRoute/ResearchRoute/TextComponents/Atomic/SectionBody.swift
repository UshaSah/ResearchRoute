//
//  SectionTitle.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionBody: View {
    let content: String
    
    init(_ content: String) {
        self.content = content
    }
    
    var body: some View {
        Text(content)
            .font(.custom(Font.bodyName, size: Font.bodySize))
            .foregroundStyle(Font.bodyColor)
            .multilineTextAlignment(.leading)
    }
}

#Preview {
    SectionBody("Title")
}

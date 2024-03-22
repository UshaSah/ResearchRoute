//
//  TextSection.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct TextSection: View {
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.custom(subtitleFontName, size: subtitleFontSize))
                .foregroundStyle(subtitleColor)
            
            Text(content)
                .font(.custom(bodyFontName, size: bodyFontSize))
                .foregroundStyle(bodyColor)
        }
    }
}

#Preview {
    TextSection(title: "Title", content: "Content")
}

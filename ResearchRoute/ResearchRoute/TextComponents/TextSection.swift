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
        VStack {
            LeftAlign {
                SectionTitle(title)
            }
            
            LeftAlign {
                SectionBody(content)
            }
        }
    }
}

#Preview {
    TextSection(title: "Title", content: "Content")
}

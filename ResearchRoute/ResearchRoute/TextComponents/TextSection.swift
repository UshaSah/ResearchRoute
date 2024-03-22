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
                HStack {
                    SectionTitle(title)
                    
                    Image(systemName: "square.and.pencil")
                        .imageScale(.medium)
                        .foregroundStyle(titleColor)
                }
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

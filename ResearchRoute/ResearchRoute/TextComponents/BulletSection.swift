//
//  BulletSection.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct BulletSection: View {
    let pointStyle = "-"
    
    let title: String
    let content: [String]
    
    var body: some View {
        VStack {
            LeftAlign {
                SectionTitle(title)
            }
            
            ForEach(content, id: \.self) { item in
                LeftAlign {
                    SectionBody(" \(pointStyle) \(item)")
                }
            }
        }
    }
}

#Preview {
    BulletSection(title: "Title", content: ["Hello", "World"])
}

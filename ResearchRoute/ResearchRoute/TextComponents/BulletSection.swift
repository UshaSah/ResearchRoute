//
//  BulletSection.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct BulletSection<T: View>: View {
    let pointStyle = "-"
    
    let title: String
    let content: [String]
    var destination: T? = nil
    
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
                LeftAlign {
                    SectionBody(" \(pointStyle) \(item)")
                }
            }
        }
    }
}

#Preview {
    BulletSection(title: "Title", content: ["Hello", "World"], destination: LandingView())
}

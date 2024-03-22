//
//  TextSection.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct TextSection<T: View>: View {
    let title: String
    let content: String
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
            
            LeftAlign {
                SectionBody(content)
            }
        }
    }
}

#Preview {
    TextSection(title: "Title", content: "Content", destination: LandingView())
}

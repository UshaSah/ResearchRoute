//
//  SectionBodyStack.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct SectionBodyStack: View {
    let content: [String]
    
    init(_ content: [String]) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            ForEach(content, id: \.self) { item in
                LeftAlign {
                    SectionBody(item)
                }
            }
        }
    }
}

#Preview {
    SectionBodyStack(["Hello", "World"])
}

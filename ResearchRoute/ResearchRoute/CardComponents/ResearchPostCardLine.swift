//
//  ResearchPostCardLine.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct ResearchPostCardLine: View {
    let imageName: String
    let text: String
    
    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: imageName)
                .imageScale(.medium)
                .foregroundStyle(titleColor)
            
            SectionBody(text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ResearchPostCardLine(imageName: "location", text: "Davis, CA")
}

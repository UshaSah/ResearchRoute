//
//  Card.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct Card: View {
    let title: String
    let university: String
    let faculty: String
    let location: String
    let pay: String
    var appliedDate: String? = nil
    var onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            VStack(spacing: 3) {
                LeftAlign {
                    SectionTitle(title)
                }
                
                ResearchPostCardLine(
                    imageName: "building",
                    text: "\(university) - \(faculty)"
                )
                
                ResearchPostCardLine(imageName: "location", text: location)
                
                LeftAlign {
                    SectionBody(pay)
                }
                
                if let appliedDate = appliedDate {
                    LeftAlign {
                        SectionBody("Applied on \(appliedDate)")
                    }
                }
            }
            .padding(10)
            .background(.white)
            .cornerRadius(5)
        }
    }
}

#Preview {
    Card(title: "Research Position", university: "UC Davis", faculty: "Sam King", location: "Davis, CA", pay: "$60k / year", appliedDate: "today") {
        
    }
}

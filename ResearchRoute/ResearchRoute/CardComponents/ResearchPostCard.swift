//
//  Card.swift
//  ResearchRoute
//
//  Created by Andrew Jowe on 3/22/24.
//

import SwiftUI

struct Card: View {
    let post: ResearchPostModel
    var appliedDate: String? = nil
    
    var body: some View {
        NavigationLink(destination: ResearchPostView()) {
            VStack(spacing: 3) {
                LeftAlign {
                    SectionTitle(post.title)
                }
                
                ResearchPostCardLine(
                    imageName: "building",
                    text: "\(post.university ?? "NA") - \(post.faculty.joined(separator: ", "))"
                )
                
                ResearchPostCardLine(imageName: "location", text: post.location ?? "NA")
                
                LeftAlign {
                    SectionBody(post.pay ?? "NA")
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
    Card(post: ResearchPostModel(title: "Research Position", faculty: ["Sam King"], university: "UC Davis", location: "Davis, CA", pay: "$60k / year"), appliedDate: "today")
}

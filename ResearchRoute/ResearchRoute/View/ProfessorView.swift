//
//  ProfessorView.swift
//  ResearchRoute
//
//  Created by Ethan He on 3/22/24.
//

import SwiftUI

struct ProfessorView: View {
    @State private var navigateToResearchView = false

    var body: some View {
        ScrollView { // Using ScrollView for better content management
            VStack {
                Image("Sam King pic")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 200)
                
                Text("Professor Sam King")
                    .font(.system(size: 18, weight: .bold, design: .serif))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.orange)
                    .padding()
                
                Text("My research focus is on technology to manage Type 1 Diabetes. Managing Type 1 Diabetes is hard, and I believe that novel software and AI can help make it easier. This research area is relatively new for me, and I'll post more details here soon.I spent nearly seven years in industry with two of them as the Head of Accounts at Twitter and two as Head of Fraud and Identity at Lyft, and 2.5 as the Head of Fraud and ML at Stripe, but now I'm back in academia at UC Davis. If you're interested, I wrote a blog post that talks about some of the lessons learned from my time in industry. I also wrote a blog post about why I moved from academia to industry and back.")
                    .font(.system(size: 13, weight: .thin, design: .serif))
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .padding()

                Button(action: {
                    navigateToResearchView = true
                }) {
                    Text("Available Research Positions!")
                        .font(.system(size: 16, weight: .heavy, design: .serif))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 45)
                        .frame(height: 50)
                        .background(LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(30)
                }
            }
        }
        .navigationTitle("Professor Details")
        .background(NavigationLink(destination: SamKingView(), isActive: $navigateToResearchView) { EmptyView() }.hidden())
    }
}

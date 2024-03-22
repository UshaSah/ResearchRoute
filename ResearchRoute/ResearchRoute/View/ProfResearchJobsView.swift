//
//  ProfessorResearchView.swift
//  researchroute
//
//  Created by Rohan Malige on 3/15/24.
//

import Foundation
import SwiftUI
struct SamKingView:View{
    var body: some View {
        TabView{
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Position: Research Assistant in Programming Languages and Artificial Intelligence")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Group {
                        Text("Location: University of California Davis, Department of Computer Science")
                        Text("Duration: Fixed-term (1 year, with the possibility of extension)")
                        Text("Start Date: ASAP")
                        Text("Application Deadline: Open until filled")
                    }
                    .font(.body)
                    .padding(.vertical, 2)
                    
                    Text("Overview:")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("We are seeking a highly motivated and skilled Research Assistant to join a dynamic research team at the University of Illinois, Department of Computer Science. Our project focuses on the intersection of programming languages and artificial intelligence, specifically working on Macho, a system that synthesizes programs from a combination of natural language, unit tests, and a large database of source code samples. This project aims to make programming faster, less error-prone, and more accessible to a broader audience by leveraging advances in natural language processing and automated debugging.")
                        .padding(.bottom, 5)
                    
                    Text("Responsibilities:")
                        .font(.headline)
                    
                    Text("""
                - Participate in the ongoing development and evaluation of the Macho system.
                - Contribute to the design and implementation of experiments to test the system's effectiveness at generating Java programs from natural language descriptions.
                - Assist in the development and maintenance of the project's codebase and database of source code samples.
                - Collaborate with team members to prepare research findings for publication in academic journals and presentations at conferences.
                - Stay updated on recent advances in programming languages, artificial intelligence, and related fields.
                """)
                    
                    Text("Qualifications:")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("""
                - Bachelor's or Master's degree in Computer Science, Artificial Intelligence, or a closely related field.
                - Strong programming skills, particularly in Java. Experience with natural language processing tools and techniques is a plus.
                - Familiarity with software development tools and practices, including version control systems (e.g., Git).
                - Ability to work both independently and as part of a team.
                - Excellent problem-solving skills and a strong interest in research.
                - Previous experience in research or a similar project-focused environment is desirable but not required.
                """)
                    
                    Text("How to Apply:")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    Text("Please send your CV, a cover letter explaining your interest and qualifications for the position, and the contact information for two references to [insert email address here]. Applications will be reviewed on a rolling basis, and the position will remain open until filled. We encourage early applications.")
                    
                    Text("The University of California Davis is an Equal Opportunity Employer. We celebrate diversity and are committed to creating an inclusive environment for all employees. Qualified individuals from all backgrounds are encouraged to apply.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.top, 5)
                }
                .padding()
            }
            .tag(0) // Tag for identification
            .navigationTitle("Programming Languages AI Job Posting")
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Position: Research Assistant in Malicious Hardware and Security")
                    .font(.title)
                    .fontWeight(.bold)
                
                Group {
                    Text("Location: University of California Davis, Davis, CA")
                    Text("Duration: Fixed-term (1 year, with the possibility of extension)")
                    Text("Start Date: ASAP")
                    Text("Application Deadline: Open until filled")
                }
                .font(.body)
                .padding(.vertical, 2)
                
                Text("Overview:")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("We invite applications for a Research Assistant position focused on the study of malicious hardware and security. This exciting opportunity is part of a cutting-edge project aimed at understanding and developing countermeasures against hardware-based security threats. The selected candidate will join a dynamic research team at the Department of Computer Science.")
                    .padding(.bottom, 5)
                
                Text("Responsibilities:")
                    .font(.headline)
                
                Text("""
                - Participate in the design and implementation of experiments to evaluate the security implications of malicious circuits within computing systems.
                - Contribute to the development of detection techniques for identifying hardware-based security threats.
                - Assist in the synthesis and analysis of malicious processor designs.
                - Collaborate on the preparation of research findings for publication in peer-reviewed journals and presentations at conferences.
                """)
                
                Text("Qualifications:")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("""
                - Enrolled in or have completed a Bachelor's or Master's degree in Computer Science, Electrical Engineering, or a related field.
                - Strong interest and, preferably, experience in hardware design, computer security, and software development.
                - Proficiency in programming languages such as VHDL/Verilog and C/C++.
                - Ability to work independently as well as part of a team.
                - Excellent analytical, problem-solving, and communication skills.
                """)
                
                Text("How to Apply:")
                    .font(.headline)
                    .padding(.top, 5)
                
                Text("Please send your resume/CV, a cover letter detailing your interest and qualifications, and contact information for two references to [insert contact email]. Review of applications will begin immediately and continue until the position is filled.")
                
                Text("University of California Davis is an equal opportunity employer. We celebrate diversity and are committed to creating an inclusive environment for all employees. Applications from women and minorities are particularly encouraged.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)
            }
            .padding()
        }
        .tag(1) // Tag for identification
        .navigationTitle("Malicious Hardware Security Job Posting")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
struct JobPostingView_Previews: PreviewProvider {
    static var previews: some View {
        SamKingView()
    }
}
    

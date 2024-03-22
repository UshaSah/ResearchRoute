import SwiftUI
import WrappingStack

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    
                    /*NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .imageScale(.medium)
                            .foregroundStyle(titleColor)
                            .padding(10)
                    }*/
                }
                
                ScrollView {
                    VStack(spacing: 3) {
                        Image(systemName: "person")
                            .font(.system(size: 90))
                        
                        HStack(spacing: 3) {
                            SectionTitle(userViewModel.studentData?.firstName ?? "name")
                            
                            NavigationLink(destination: EditNameView()) {
                                Image(systemName: "square.and.pencil")
                                    .imageScale(.medium)
                                    .foregroundStyle(titleColor)
                            }
                        }
                        ResumeParserView()
                        //CoverLetterGeneratorView()
                    }
                    
                    TextSection(
                        title: "About Me",
                        content: userViewModel.studentData?.aboutMe ?? "content",
                        destination: EditAboutMeView()
                    )
                    
                    
                    SectionList(
                        title: "Education",
                        content: userViewModel.studentData?.education ?? [],
                        destination: EditEducationItemView()
                    ) { education in
                        SectionListItem(education.university) {
                            SectionBodyStack([
                                "\(education.startDate) - \(education.endDate)",
                                education.degree
                            ])
                        }
                    }
                    
                    SectionList(
                        title: "Experience",
                        content: userViewModel.studentData?.experience ?? [],
                        destination: EditExperienceItemView()
                    ) { experience in
                        SectionListItem(experience.title) {
                            SectionBodyStack([
                                experience.organizationName,
                                "\(experience.startDate) - \(experience.endDate)",
                                experience.description
                            ])
                        }
                    }
                    
                    BulletSection(
                        title: "Coursework",
                        content: userViewModel.studentData?.coursework ?? ["classes"],
                        destination: EditCourseworkView()
                    )
                    
                    BulletSection(
                        title: "Skills",
                        content: userViewModel.studentData?.skills ?? ["skills"],
                        destination: EditSkillsView()
                    )
                }
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
}

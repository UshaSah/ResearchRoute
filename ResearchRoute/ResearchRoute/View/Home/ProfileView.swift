import SwiftUI
import WrappingStack

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            HStack {
                SuperTitle(userViewModel.studentData?.firstName ?? "name")
                
                Spacer()
                
                Image(systemName: "gearshape")
                    .imageScale(.medium)
                    .foregroundStyle(titleColor)
                    .padding(10)
            }
            
            ScrollView {
                TextSection(
                    title: "About Me",
                    content: userViewModel.studentData?.aboutMe ?? "content"
                )
                
                BulletSection(
                    title: "Majors",
                    content: userViewModel.studentData?.majors ?? ["majors"]
                )
                
                SectionList(
                    title: "Education",
                    content: userViewModel.studentData?.education ?? []
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
                    content: userViewModel.studentData?.experience ?? []
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
                    content: userViewModel.studentData?.coursework ?? ["classes"]
                )
                
                BulletSection(
                    title: "Skills",
                    content: userViewModel.studentData?.skills ?? ["skills"]
                )
            }
            .padding()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(UserViewModel())
}

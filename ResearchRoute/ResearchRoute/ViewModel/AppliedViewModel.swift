import SwiftUI

class AppliedViewModel: ViewModel {
    @Published var posts: [ResearchPostModel] = []
    
    func getPosts(as userViewModel: UserViewModel) {
        doTask {
            guard let student = userViewModel.studentData else {
                throw AuthApiError.notLoggedIn
            }
            
            return try await ResearchPostApi.read(refs: student.applied ?? [])
        } callback: { posts in
            self.posts = posts
        }
    }
}

import SwiftUI

class RecommendedViewModel: ViewModel {
    @Published var posts: [ResearchPostModel] = []
    
    func getPosts(as user: UserViewModel) {
        doTask {
            return try await ResearchPostApi.read(keywords: user.studentData?.keywords ?? [])
        } callback: { posts in
            self.posts = posts
        }
    }
}

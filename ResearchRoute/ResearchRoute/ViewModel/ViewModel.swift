import SwiftUI

// Base for View Model
class ViewModel: ObservableObject {
    @Published var errorMessage = ""
    
    func doTask<T>(_ task: @escaping () async throws -> T, callback: @escaping (_ result: T) -> Void) {
        errorMessage = ""
        Task {
            do {
                let result = try await task()
                await MainActor.run {
                    callback(result)
                }
            }
            catch {
                await MainActor.run {
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}


final class PostRepository: PostRepositoryProtocol {

   
    private let apiService: APIServiceProtocol


    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }

    func getPosts() async throws -> [Post] {

        
        return try await apiService.fetchPosts()
    }
}

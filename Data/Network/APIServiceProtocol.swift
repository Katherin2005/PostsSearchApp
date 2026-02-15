protocol APIServiceProtocol {
    func fetchPosts() async throws -> [Post]
}

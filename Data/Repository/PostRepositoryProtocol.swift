protocol PostRepositoryProtocol {

    func getPosts() async throws -> [Post]
}

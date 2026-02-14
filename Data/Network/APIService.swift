
final class APIService: APIServiceProtocol {

    private let baseURL = "https://gorest.co.in/public/v1/posts"

    func fetchPosts() async throws -> [Post] {

        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decodedResponse = try JSONDecoder().decode(PostResponse.self, from: data)

        return decodedResponse.data
    }
}

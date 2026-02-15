import Foundation
import SwiftUI


@MainActor
final class PostListViewModel: ObservableObject {

    @Published var posts: [Post] = []

    @Published var filteredPosts: [Post] = []

    @Published var searchText: String = ""

    private let repository: PostRepositoryProtocol

    init(repository: PostRepositoryProtocol) {
        self.repository = repository
    }

    //FUnciones
    
    func loadPosts() async {
        do {
            let result = try await repository.getPosts()

            posts = result

            filteredPosts = result

        } catch {
            print("errror al cargar los posts :", error)
        }
    }

    
    
    func filterPosts() {

        if searchText.isEmpty {
            filteredPosts = posts
        } else {
            filteredPosts = posts.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

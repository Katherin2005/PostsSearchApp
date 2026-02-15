import SwiftUI

struct PostListView: View {

    // StateObject porque esta vista crea y mantiene el ViewModel
    @StateObject var viewModel: PostListViewModel

    var body: some View {

        NavigationView {

            List(viewModel.filteredPosts) { post in
                VStack(alignment: .leading) {

                    Text(post.title)
                        .font(.headline)

                    Text(post.body)
                        .font(.subheadline)
                        .lineLimit(2)
                }
            }

            // barra de búsqueda nativa SwiftUI
            .searchable(text: $viewModel.searchText)

            // cada vez que cambia el texto
            // filtramos resultados
            .onChange(of: viewModel.searchText) { _ in
                viewModel.filterPosts()
            }

            // se ejecuta cuando aparece la vista
            // carga los posts desde el API
            .task {
                await viewModel.loadPosts()
            }

            .navigationTitle("Posts")
        }
    }
}

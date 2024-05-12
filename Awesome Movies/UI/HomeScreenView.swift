import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {

        List(viewModel.data) { movie in
            HStack {
                Text(movie.title)
                Spacer()
                Text(movie.popularity.description)
            }
        }.listStyle(.plain)

    }
}

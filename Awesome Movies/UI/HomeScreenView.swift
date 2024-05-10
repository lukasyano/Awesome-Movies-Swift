import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    HomeScreenView(viewModel: HomeViewModel(trendingMoviesRepository: TrendingMoviesRepository(api: ApiService(), dao: MoviesDao())))
}

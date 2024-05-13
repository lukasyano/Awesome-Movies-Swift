import SwiftUI

struct HomeScreenView: View {
    @StateObject var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollViewReader { scrollViewProxy in
                    ScrollView(showsIndicators: false) {
                        LazyVStack {
                            ForEach(viewModel.data) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                    }
                    .toolbar {
                            ToolbarItem(placement: .principal) {
                                withAnimation {
                                    Picker(selection: $viewModel.selectedSortingType, label: Text("Sort By")) {
                                        if viewModel.selectedSortingType != .default {
                                            Text(SortingType.default.rawValue).tag(SortingType.default)
                                        }
                                        Text(SortingType.date.rawValue).tag(SortingType.date)
                                        Text(SortingType.votes.rawValue).tag(SortingType.votes)
                                        Text(SortingType.popularity.rawValue).tag(SortingType.popularity)
                                    }
                                    .pickerStyle(.segmented)
                                    .onChange(of: viewModel.selectedSortingType) { _, newSortingType in
                                        withAnimation {
                                            viewModel.getSortedMovies(sortingType: newSortingType)
                                            scrollViewProxy.scrollTo(viewModel.data.first!.id)
                                        }
                                    }
                                }
                            }
                        }
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    HomeScreenView(viewModel: HomeViewModel(trendingMoviesRepository: TrendingMoviesRepository(api: ApiService(), dao: MoviesDao())))
}

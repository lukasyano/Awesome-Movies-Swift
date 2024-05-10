import SwiftUI

struct MainScreen: View {
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol
    @StateObject var homeViewModel: HomeViewModel
    
    init(trendingMoviesRepository: TrendingMoviesRepositoryProtocol) {
        self.trendingMoviesRepository = trendingMoviesRepository
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(trendingMoviesRepository: trendingMoviesRepository))
    }
    
    var body: some View {
        HomeScreenView(viewModel: homeViewModel)
    }
}

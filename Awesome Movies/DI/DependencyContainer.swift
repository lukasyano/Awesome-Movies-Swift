import Foundation

class DependencyContainer: ObservableObject {
    private let api: ApiServiceProtocol = ApiService()
    private let dao: MoviesDaoProtocol = MoviesDao()
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol

    init() {
        self.trendingMoviesRepository = TrendingMoviesRepository(api: api, dao: dao)
    }
}

extension DependencyContainer: ViewModelProviderProtocol {
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(trendingMoviesRepository: trendingMoviesRepository)
    }
}

import SwiftUI
@main
struct Awesome_MoviesApp: App {
    private let moviesDao: MoviesDaoProtocol = MoviesDao()
    private let api: ApiServiceProtocol = ApiService()
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol

    init() {
        self.trendingMoviesRepository = TrendingMoviesRepository(api: api, dao: moviesDao)
    }

    var body: some Scene {
        WindowGroup {
            MainScreen(trendingMoviesRepository: trendingMoviesRepository)
        }
    }
}

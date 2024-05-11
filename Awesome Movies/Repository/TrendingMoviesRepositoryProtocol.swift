import Combine

protocol TrendingMoviesRepositoryProtocol {
    func getTrendingMovies(pageNr: Int, filterType: FilterType) -> AnyPublisher<[MovieEntity], Error>
}

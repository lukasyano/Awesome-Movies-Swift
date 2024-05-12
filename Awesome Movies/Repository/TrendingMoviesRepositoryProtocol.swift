import Combine

protocol TrendingMoviesRepositoryProtocol {
    func getTrendingMovies(pageNr: Int, sortingType: SortingType) -> AnyPublisher<[MovieEntity], Error>
}

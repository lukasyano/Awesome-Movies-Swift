import Combine

protocol ApiServiceProtocol {
    func getTrendingMovies(pageNr: Int) -> AnyPublisher<MoviesResponse, Error>
}



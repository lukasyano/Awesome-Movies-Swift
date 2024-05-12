import Combine
import Foundation

class TrendingMoviesRepository: TrendingMoviesRepositoryProtocol {
    private let api: ApiServiceProtocol
    private let dao: MoviesDaoProtocol

    init(api: ApiServiceProtocol, dao: MoviesDaoProtocol) {
        self.api = api
        self.dao = dao
    }

    func getTrendingMovies(pageNr: Int, sortingType: SortingType) -> AnyPublisher<[MovieEntity], Error> {
        return api.getTrendingMovies(pageNr: pageNr)
            .map { movieResponse in

                Mapper.mapMovies(results: movieResponse.results, sortingType: sortingType)

            }.eraseToAnyPublisher()
    }
}

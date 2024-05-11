import Combine
import Foundation

enum FilterType {
    case unfiltered, popularity, votes, date
}

class TrendingMoviesRepository: TrendingMoviesRepositoryProtocol {
    private let api: ApiServiceProtocol
    private let dao: MoviesDaoProtocol

    init(api: ApiServiceProtocol, dao: MoviesDaoProtocol) {
        self.api = api
        self.dao = dao
    }

    func getTrendingMovies(pageNr: Int, filterType: FilterType) -> AnyPublisher<[MovieEntity], Error> {
        return api.getTrendingMovies(pageNr: pageNr)
            .map { movieResponse in
                switch filterType {
                case .unfiltered:
                    Mapper.mapMovies(results: movieResponse.results)
                case .popularity:
                    Mapper.mapMovies(results: movieResponse.results.sorted { $0.popularity ?? 0.0 > $1.popularity ?? 0.0 } )
                case .votes:
                    Mapper.mapMovies(results: movieResponse.results.sorted { $0.voteAverage ?? 0.0 > $1.voteAverage ?? 0.0 } )
                case .date:
                    Mapper.mapMovies(results: movieResponse.results.sorted { $0.releaseDate ?? "" > $1.releaseDate ?? "" } )
                }
            }.eraseToAnyPublisher()
    }
}

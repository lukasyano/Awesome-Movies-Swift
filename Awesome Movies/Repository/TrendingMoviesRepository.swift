import Foundation

class TrendingMoviesRepository: TrendingMoviesRepositoryProtocol, ObservableObject {
    private let api: ApiServiceProtocol
    private let dao: MoviesDaoProtocol

    init(api: ApiServiceProtocol, dao: MoviesDaoProtocol) {
        self.api = api
        self.dao = dao
    }
}


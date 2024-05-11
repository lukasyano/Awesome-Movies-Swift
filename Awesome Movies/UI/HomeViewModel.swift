import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var data: [String] = []
    @Published var uiError: String = ""

    init(trendingMoviesRepository: TrendingMoviesRepositoryProtocol) {
        self.trendingMoviesRepository = trendingMoviesRepository
        Log.debug("HomeViewModel Init")
        trendingMoviesRepository.getTrendingMovies(pageNr: 1, filterType: .unfiltered)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    self.uiError = error.localizedDescription
                }
            } receiveValue: { print($0) }
            .store(in: &cancellables)
    }
}

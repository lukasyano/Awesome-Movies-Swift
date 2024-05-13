import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()

    @Published var data = [MovieEntity]()
    @Published var uiError: String = ""
    @Published var selectedSortingType : SortingType = .default

    init(trendingMoviesRepository: TrendingMoviesRepositoryProtocol) {
        self.trendingMoviesRepository = trendingMoviesRepository
        Log.debug("HomeViewModel Init")

        getTrendingMovies(sortingType: .default)
    }

    private func getTrendingMovies(pageNr: Int = 1, sortingType: SortingType = .popularity) {
        trendingMoviesRepository.getTrendingMovies(pageNr: 1, sortingType: sortingType)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished: break
                case let .failure(error):
                    self?.uiError = error.localizedDescription
                }
            } receiveValue: { [weak self] movieEntities in
                self?.data = movieEntities
            }
            .store(in: &cancellables)
    }
    
    func getSortedMovies(sortingType: SortingType){
        getTrendingMovies(sortingType: sortingType)
    }
}

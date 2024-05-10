import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    private let trendingMoviesRepository: TrendingMoviesRepositoryProtocol
    
    init(trendingMoviesRepository: TrendingMoviesRepositoryProtocol) {
        self.trendingMoviesRepository = trendingMoviesRepository
    }
    
    @Published var data: [String] = []
}

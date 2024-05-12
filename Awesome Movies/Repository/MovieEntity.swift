import Foundation

struct MovieEntity: Identifiable {
    let id: UUID
    let title: String
    let popularity: Double
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    let posterPath: String
}

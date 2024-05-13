import Foundation

struct MovieEntity: Identifiable, Hashable {
    let id: Int
    let title: String
    let popularity: Double
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    let posterUrl: String
}

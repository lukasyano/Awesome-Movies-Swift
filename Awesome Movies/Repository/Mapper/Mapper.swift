import Foundation

enum Mapper {
    static func mapMovies(results: [MovieResult]) -> [MovieEntity] {
        return results.map {
            MovieEntity(
                id: UUID(uuidString: $0.id?.description ?? "") ?? UUID(),
                title: $0.title ?? "",
                popularity: $0.popularity ?? 0.0,
                overview: $0.overview ?? "",
                releaseDate: $0.releaseDate ?? "",
                voteAverage: $0.voteAverage ?? 0.0,
                voteCount: $0.voteCount ?? 0,
                posterPath: $0.posterPath ?? ""
            )
        }
    }
}

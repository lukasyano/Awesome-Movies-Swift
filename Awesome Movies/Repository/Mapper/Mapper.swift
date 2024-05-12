import Foundation

enum Mapper {
    static func mapMovies(results: [MovieResult], sortingType: SortingType) -> [MovieEntity] {
        var sortedResults = results

        switch sortingType {
        case .popularity:
            sortedResults.sort { $0.popularity ?? 0.0 > $1.popularity ?? 0.0 }
        case .votes:
            sortedResults.sort { $0.voteCount ?? 0 > $1.voteCount ?? 0 }
        case .date:
            sortedResults.sort { $0.releaseDate ?? "" > $1.releaseDate ?? "" }
        default:
            break
        }

        return sortedResults.map {
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

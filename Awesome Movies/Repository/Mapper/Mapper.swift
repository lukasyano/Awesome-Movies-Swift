import Foundation

enum Mapper {
    static func mapMovies(results: [MovieResult], sortingType: SortingType) -> [MovieEntity] {
        var sortedResults = results

        switch sortingType {
        case .popularity:
            sortedResults.sort { $0.popularity ?? 0.0 > $1.popularity ?? 0.0 }
        case .votes:
            sortedResults.sort { $0.voteAverage ?? 0 > $1.voteAverage ?? 0 }
        case .date:
            sortedResults.sort { $0.releaseDate ?? "" > $1.releaseDate ?? "" }
        default:
            break
        }

        return sortedResults.map {
            MovieEntity(
               id: $0.id ?? -1,
              //  id: UUID(uuidString: $0.id?.description ?? "") ?? UUID(),
                title: $0.title ?? "",
                popularity: $0.popularity ?? 0.0,
                overview: $0.overview ?? "",
                releaseDate: $0.releaseDate ?? "",
                voteAverage: round(($0.voteAverage ?? 0.0) * 10) / 10.0,
                voteCount: $0.voteCount ?? 0,
                posterUrl: Constants.imageBaseUrl + ($0.posterPath ?? "")
            )
        }
    }
}

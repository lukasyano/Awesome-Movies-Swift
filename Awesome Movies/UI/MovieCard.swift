import SwiftUI

struct MovieCard: View {
    let movie: MovieEntity
    var body: some View {
        HStack(spacing: 10) {
            CachedImage(url: movie.posterUrl) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().scaledToFit().frame(width: 100)
                case .failure(let error):
                    let _ = print(error)
                @unknown default:
                    EmptyView()
                }
            }.padding(1)
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title).font(.headline)
                Text(movie.overview).font(.subheadline).lineLimit(3)
                Text(movie.id.description)

                Spacer()
                HStack {
                    Spacer()
                    Text(movie.voteAverage.description)
                    Image(systemName: "star")
                }
            }.padding(.vertical, 10)
            Spacer()
        }
    }
}

struct MoviesResponse: Decodable {
    let page: Int?
    let results: [MovieResult]
    let total_pages: Int?
    let total_results: Int?
}

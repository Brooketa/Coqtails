class SearchUseCase: SearchUseCaseProtocol {

    private let searchClient: SearchClientProtocol

    init(searchClient: SearchClientProtocol) {
        self.searchClient = searchClient
    }

    func searchCocktails(query: String) async throws -> [SearchCocktailUseCaseModel] {
        try await searchClient
            .searchCocktails(query: query)
            .map { SearchCocktailUseCaseModel(from: $0) }
    }

}

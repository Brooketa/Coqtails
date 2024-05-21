class SearchUseCase: SearchUseCaseProtocol {

    private let searchClient: SearchClientProtocol

    init(searchClient: SearchClientProtocol) {
        self.searchClient = searchClient
    }

    func searchCoctails(query: String) async throws -> [SearchCocktailUseCaseModel] {
        try await searchClient
            .searchCoctails(query: query)
            .map { SearchCocktailUseCaseModel(from: $0) }
    }

}

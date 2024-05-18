class SearchUseCase: SearchUseCaseProtocol {

    private let searchClient: SearchClientProtocol

    init(searchClient: SearchClientProtocol) {
        self.searchClient = searchClient
    }

    func searchCoctails(query: String) async throws -> [SearchCoctailUseCaseModel] {
        try await searchClient
            .searchCoctails(query: query)
            .map { SearchCoctailUseCaseModel(from: $0) }
    }

}

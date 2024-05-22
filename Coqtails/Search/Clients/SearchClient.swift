class SearchClient: SearchClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func searchCocktails(query: String) async throws -> [SearchCocktailClientModel] {
        let endpoint = SearchEndpoint.search(query)

        let response: SearchCocktailResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        return response.drinks ?? []
    }

}

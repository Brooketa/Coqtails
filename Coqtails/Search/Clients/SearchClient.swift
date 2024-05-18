class SearchClient: SearchClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func searchCoctails(query: String) async throws -> [SearchCocktailClientModel] {
        let response: SearchCocktailResponseModel = try await baseClient.execute(
            path: SearchEndpoints.searchPath,
            method: .get,
            parameters: ["s": query])

        return response.drinks ?? []
    }

}

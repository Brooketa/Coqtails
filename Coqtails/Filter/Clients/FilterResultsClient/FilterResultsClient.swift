class FilterResultsClient: FilterResultsClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchFilteredCocktails(for selectedFilters: [SelectedFilter]) async throws -> [FilterResultClientModel] {
        let endpoint = FilterEndpoint.filtering(selectedFilters)

        let response: FilterResultsResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        return response.drinks  ?? []
    }

}

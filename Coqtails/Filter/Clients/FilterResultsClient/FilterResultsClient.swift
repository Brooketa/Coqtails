class FilterResultsClient: FilterResultsClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchFilteredCocktails(for selectedFilters: [SelectedFilter]) async throws -> [FilterResultClientModel] {
        let endpoint = FilterEndpoint.filtering(selectedFilters)

        let response: FilterResultsIDNetworkResponse = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        let cocktailIDModels = response.ids ?? []

        //drops 80% of the array if it's too large so it doesn't get blocked by DDOS protection
        var dropLastCount: Int = 0
        if cocktailIDModels.count > 40 {
            dropLastCount = Int(Double(cocktailIDModels.count) * 0.8)
        }

        return try await cocktailIDModels
            .dropLast(dropLastCount)
            .concurrentMap { [unowned self] clientIDModel -> FilterResultClientModel? in
                try await self.fetchFilteredCocktailDetails(for: clientIDModel.id)
            }
            .compactMap { $0 }
    }

    private func fetchFilteredCocktailDetails(for cocktailID: String) async throws -> FilterResultClientModel? {
        let endpoint = FilterEndpoint.details(cocktailID)

        let response: FilterResultsNetworkResponse = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        guard let filteredCocktailDetails = response.filteredCocktailDetails.first else { return nil }

        return filteredCocktailDetails
    }

}

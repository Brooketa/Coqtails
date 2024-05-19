class FiltersClient: FiltersClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchCategoryTypes() async throws -> [FilterCategoryTypeClientModel] {
        let endpoint = FilterEndpoint.category

        let response: FilterCategoryTypeResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        return response.categoryTypes
    }

    func fetchGlassTypes() async throws -> [FilterGlassTypeClientModel] {
        let endpoint = FilterEndpoint.glass

        let response: FilterGlassTypeResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        return response.glassTypes
    }

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeClientModel] {
        let endpoint = FilterEndpoint.alcoholic

        let response: FilterAlcoholicTypeResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        return response.drinkTypes
    }

}

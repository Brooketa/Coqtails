class FiltersClient: FiltersClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchCategoryTypes() async throws -> [FilterCategoryTypeClientModel] {
        let response: FilterCategoryTypeResponseModel = try await baseClient.execute(
            path: FilterEndpoints.list,
            method: .get,
            parameters: ["c": "list"])

        return response.categoryTypes
    }

    func fetchGlassTypes() async throws -> [FilterGlassTypeClientModel] {
        let response: FilterGlassTypeResponseModel = try await baseClient.execute(
            path: FilterEndpoints.list,
            method: .get,
            parameters: ["g": "list"])

        return response.glassTypes
    }

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeClientModel] {
        let response: FilterAlcoholicTypeResponseModel = try await baseClient.execute(
            path: FilterEndpoints.list,
            method: .get,
            parameters: ["a": "list"])

        return response.drinkTypes
    }

}

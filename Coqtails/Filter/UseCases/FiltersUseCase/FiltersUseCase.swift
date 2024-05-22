class FiltersUseCase: FiltersUseCaseProtocol {

    private let filtersClient: FiltersClientProtocol

    init(filtersClient: FiltersClientProtocol) {
        self.filtersClient = filtersClient
    }

    func fetchCategoryTypes() async throws -> [FilterCategoryTypeUseCaseModel] {
        try await filtersClient
            .fetchCategoryTypes()
            .map { FilterCategoryTypeUseCaseModel(from: $0) }
    }

    func fetchGlassTypes() async throws -> [FilterGlassTypeUseCaseModel] {
        try await filtersClient
            .fetchGlassTypes()
            .map { FilterGlassTypeUseCaseModel(from: $0) }
    }

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeUseCaseModel] {
        try await filtersClient
            .fetchAlcoholicTypes()
            .map { FilterAlcoholicTypeUseCaseModel(from: $0) }
    }

}

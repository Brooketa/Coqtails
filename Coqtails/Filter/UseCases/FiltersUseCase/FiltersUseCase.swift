class FiltersUseCase: FiltersUseCaseProtocol {

    private let filterClient: FiltersClientProtocol

    init(filterClient: FiltersClientProtocol) {
        self.filterClient = filterClient
    }

    func fetchCategoryTypes() async throws -> [FilterCategoryTypeUseCaseModel] {
        try await filterClient
            .fetchCategoryTypes()
            .map { FilterCategoryTypeUseCaseModel(from: $0) }
    }

    func fetchGlassTypes() async throws -> [FilterGlassTypeUseCaseModel] {
        try await filterClient
            .fetchGlassTypes()
            .map { FilterGlassTypeUseCaseModel(from: $0) }
    }

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeUseCaseModel] {
        try await filterClient
            .fetchAlcoholicTypes()
            .map { FilterAlcoholicTypeUseCaseModel(from: $0) }
    }

}

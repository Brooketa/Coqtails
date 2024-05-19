protocol FiltersUseCaseProtocol {

    func fetchCategoryTypes() async throws  -> [FilterCategoryTypeUseCaseModel]

    func fetchGlassTypes() async throws -> [FilterGlassTypeUseCaseModel]

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeUseCaseModel]

}

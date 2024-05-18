protocol FiltersClientProtocol {

    func fetchCategoryTypes() async throws  -> [FilterCategoryTypeClientModel]

    func fetchGlassTypes() async throws -> [FilterGlassTypeClientModel]

    func fetchAlcoholicTypes() async throws -> [FilterAlcoholicTypeClientModel]

}

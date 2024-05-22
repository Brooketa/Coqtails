protocol SearchUseCaseProtocol {

    func searchCocktails(query: String) async throws -> [SearchCocktailUseCaseModel]

}

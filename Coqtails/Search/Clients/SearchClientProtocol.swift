protocol SearchClientProtocol {

    func searchCocktails(query: String) async throws -> [SearchCocktailClientModel]

}

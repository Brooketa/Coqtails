protocol SearchClientProtocol {

    func searchCoctails(query: String) async throws -> [SearchCocktailClientModel]

}

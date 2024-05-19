protocol DetailsClientProtocol {

    func fetchCocktailDetails(for cocktailID: String) async throws -> DetailsCocktailClientModel

    func fetchRandomCocktailDetails() async throws -> DetailsCocktailClientModel

}

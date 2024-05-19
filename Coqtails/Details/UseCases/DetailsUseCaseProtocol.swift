protocol DetailsUseCaseProtocol {

    func fetchCocktailDetails(for cocktailID: String) async throws -> DetailsCocktailUseCaseModel

    func fetchRandomCocktailDetails() async throws -> DetailsCocktailUseCaseModel

}

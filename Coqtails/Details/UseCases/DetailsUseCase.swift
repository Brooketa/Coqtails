class DetailsUseCase: DetailsUseCaseProtocol {

    private let detailsClient: DetailsClientProtocol

    init(detailsClient: DetailsClientProtocol) {
        self.detailsClient = detailsClient
    }

    func fetchCocktailDetails(for cocktailID: String) async throws -> DetailsCocktailUseCaseModel {
        let cocktailDetails = try await detailsClient
            .fetchCocktailDetails(for: cocktailID)

        return DetailsCocktailUseCaseModel(from: cocktailDetails)
    }

    func fetchRandomCocktailDetails() async throws -> DetailsCocktailUseCaseModel {
        let randomCocktail = try await detailsClient.fetchRandomCocktailDetails()

        return DetailsCocktailUseCaseModel(from: randomCocktail)
    }

}

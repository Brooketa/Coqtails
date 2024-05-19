class DetailsClient: DetailsClientProtocol {

    private let baseClient: BaseClientProtocol

    init(baseClient: BaseClientProtocol) {
        self.baseClient = baseClient
    }

    func fetchCocktailDetails(for cocktailID: String) async throws -> DetailsCocktailClientModel {
        let endpoint = DetailsEndpoint.lookup(cocktailID)

        let response: DetailsCocktailResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get,
            parameters: endpoint.parameters)

        guard let cocktailDetails = response.cocktailDetails.first else {
            throw APIError.genericError("No data")
        }
    
        return cocktailDetails
    }

    func fetchRandomCocktailDetails() async throws -> DetailsCocktailClientModel {
        let endpoint = DetailsEndpoint.random

        let response: DetailsCocktailResponseModel = try await baseClient.execute(
            path: endpoint.path,
            method: .get)

        guard let randomCocktail = response.cocktailDetails.first else {
            throw APIError.genericError("No data")
        }

        return randomCocktail
    }

}

struct FilterResultsNetworkResponse: Decodable {

    let filteredCocktailDetails: [FilterResultClientModel]

    enum CodingKeys: String, CodingKey {
        case filteredCocktailDetails = "drinks"
    }

}

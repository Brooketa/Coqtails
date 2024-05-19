struct DetailsCocktailResponseModel: Decodable {

    let cocktailDetails: [DetailsCocktailClientModel]

    enum CodingKeys: String, CodingKey {
        case cocktailDetails = "drinks"
    }

}

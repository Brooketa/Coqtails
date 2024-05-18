struct SearchCocktailClientModel: Decodable {

    let id: String?
    let thumbnailURL: String?
    let name: String?
    let instructions: String?

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case thumbnailURL = "strDrinkThumb"
        case name = "strDrink"
        case instructions = "strInstructions"
    }

}

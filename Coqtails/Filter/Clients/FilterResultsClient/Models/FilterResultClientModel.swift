struct FilterResultClientModel: Decodable {

    let id: String
    let thumbnailURL: String?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case thumbnailURL = "strDrinkThumb"
        case name = "strDrink"
    }

}

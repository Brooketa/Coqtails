struct FilterResultIDClientModel: Decodable {

    let id: String

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
    }

}

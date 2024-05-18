struct FilterAlcoholicTypeResponseModel: Decodable {

    let drinkTypes: [FilterAlcoholicTypeClientModel]

    enum CodingKeys: String, CodingKey {
        case drinkTypes = "drinks"
    }

}

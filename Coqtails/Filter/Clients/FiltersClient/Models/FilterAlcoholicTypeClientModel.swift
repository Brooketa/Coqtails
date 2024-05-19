struct FilterAlcoholicTypeClientModel: Decodable {

    let filterName: String

    enum CodingKeys: String, CodingKey {
        case filterName = "strAlcoholic"
    }

}

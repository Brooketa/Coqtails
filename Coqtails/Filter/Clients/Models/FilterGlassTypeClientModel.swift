struct FilterGlassTypeClientModel: Decodable {

    let filterName: String

    enum CodingKeys: String, CodingKey {
        case filterName = "strGlass"
    }

}

struct FilterGlassTypeResponseModel: Decodable {

    let glassTypes: [FilterGlassTypeClientModel]

    enum CodingKeys: String, CodingKey {
        case glassTypes = "drinks"
    }

}

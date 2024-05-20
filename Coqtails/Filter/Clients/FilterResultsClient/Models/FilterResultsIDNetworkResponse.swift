struct FilterResultsIDNetworkResponse: Decodable {

    let ids: [FilterResultIDClientModel]?

    enum CodingKeys: String, CodingKey {
        case ids = "drinks"
    }

}

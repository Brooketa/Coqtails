struct FilterCategoryTypeResponseModel: Decodable {

    let categoryTypes: [FilterCategoryTypeClientModel]

    enum CodingKeys: String, CodingKey {
        case categoryTypes = "drinks"
    }

}

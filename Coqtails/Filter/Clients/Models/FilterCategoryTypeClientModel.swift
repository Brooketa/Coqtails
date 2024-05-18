struct FilterCategoryTypeClientModel: Decodable {

    let filterName: String

    enum CodingKeys: String, CodingKey {
        case filterName = "strCategory"
    }

}

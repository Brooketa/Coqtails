struct SearchCocktailClientModel {

    let id: String
    let thumbnailURL: String?
    let name: String
    let ingredients: String

}

extension SearchCocktailClientModel: Decodable {

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case thumbnailURL = "strDrinkThumb"
        case name = "strDrink"
    }

    init(from decoder: Decoder) throws {
        let dynamicKeysContainer = try decoder.container(keyedBy: DynamicCodingKey.self)

        var ingredients = [String]()

        dynamicKeysContainer.allKeys.forEach { key in
            if
                key.stringValue.hasPrefix("strIngredient"),
                let ingredient = try? dynamicKeysContainer.decode(String.self, forKey: key)
            {
                ingredients.append(ingredient)
            }
        }

        let mergedIngredients = ingredients.joined(separator: ", ")

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnailURL = try container.decode(String.self, forKey: .thumbnailURL)
        self.ingredients = mergedIngredients
    }

}

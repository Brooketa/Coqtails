import Foundation

struct DetailsCocktailClientModel {

    let id: String
    let name: String
    let thumbnailURL: String?
    let category: String
    let glassType: String
    let drinkType: String
    let instructions: String?
    let ingredients: [String]
    let lastModified: String?

}

extension DetailsCocktailClientModel: Decodable {

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case thumbnailURL = "strDrinkThumb"
        case category = "strCategory"
        case glassType = "strGlass"
        case drinkType = "strAlcoholic"
        case instructions = "strInstructions"
        case lastModified = "dateModified"
    }

    init(from decoder: Decoder) throws {
        let dynamicKeysContainer = try decoder.container(keyedBy: DynamicCodingKey.self)

        var measurements = [String]()
        var ingredients = [String]()
        var measuresWithIngredients = [String]()

        dynamicKeysContainer.allKeys.forEach { key in
            if
                key.stringValue.hasPrefix("strMeasure"),
                let measure = try? dynamicKeysContainer.decode(String.self, forKey: key)
            {
                measurements.append(measure)
            }

            if
                key.stringValue.hasPrefix("strIngredient"),
                let ingredient = try? dynamicKeysContainer.decode(String.self, forKey: key)
            {
                ingredients.append(ingredient)
            }
        }

        for index in 0 ..< ingredients.count {
            let measure = index < measurements.count ? measurements[index] : ""
            let ingredient = ingredients[index]

            measuresWithIngredients.append("\(measure)\(ingredient)")
        }

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnailURL = try container.decode(String.self, forKey: .thumbnailURL)
        self.category = try container.decode(String.self, forKey: .category)
        self.glassType = try container.decode(String.self, forKey: .glassType)
        self.drinkType = try container.decode(String.self, forKey: .drinkType)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.lastModified = try? container.decode(String.self, forKey: .lastModified)
        self.ingredients = measuresWithIngredients
    }

}

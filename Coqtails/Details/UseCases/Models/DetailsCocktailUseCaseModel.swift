import Foundation

struct DetailsCocktailUseCaseModel {

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

extension DetailsCocktailUseCaseModel {

    init(from model: DetailsCocktailClientModel) {
        self.id = model.id
        self.name = model.name
        self.thumbnailURL = model.thumbnailURL
        self.category = model.category
        self.glassType = model.glassType
        self.drinkType = model.drinkType
        self.instructions = model.instructions
        self.ingredients = model.ingredients
        self.lastModified = model.lastModified
    }

}

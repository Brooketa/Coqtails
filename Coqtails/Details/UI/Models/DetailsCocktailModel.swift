import Foundation

struct DetailsCocktailModel: Equatable {

    let id: String
    let name: String
    let thumbnailURL: URL?
    let category: String
    let glassType: String
    let drinkType: String
    let instructions: String?
    let ingredients: [String]
    let lastModified: Date

}

extension DetailsCocktailModel {

    init(from model: DetailsCocktailUseCaseModel) {
        self.id = model.id
        self.name = model.name
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.category = model.category
        self.glassType = model.glassType
        self.drinkType = model.drinkType
        self.instructions = model.instructions
        self.ingredients = model.ingredients
        self.lastModified = DateFormatter.iso8601NoTDateFormatter.date(from: model.lastModified ?? "") ?? Date()
    }

}

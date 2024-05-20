import Foundation

struct FilterResultCocktailModel: Identifiable, Hashable {

    let id = UUID()
    let cocktailID: String?
    let thumbnailURL: URL?
    let name: String
    let ingredients: String

    init(from model: FilterResultUseCaseModel) {
        self.cocktailID = model.id
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

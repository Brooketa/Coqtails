import Foundation

struct FilterResultCocktailModel: Identifiable, Hashable {

    var id: String { cocktailID }
    let cocktailID: String
    let thumbnailURL: URL?
    let name: String
    let ingredients: String

}

extension FilterResultCocktailModel {

    init(from model: FilterResultUseCaseModel) {
        self.cocktailID = model.id
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

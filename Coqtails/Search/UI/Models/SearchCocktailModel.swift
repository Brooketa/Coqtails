import Foundation

struct SearchCocktailModel: Identifiable, Hashable {

    var id: String { remoteID }
    let highlightText: String
    let remoteID: String
    let thumbnailURL: URL?
    let name: String
    let ingredients: String

}

extension SearchCocktailModel {

    init(for searchText: String, from model: SearchCocktailUseCaseModel) {
        self.highlightText = searchText
        self.remoteID = model.id
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

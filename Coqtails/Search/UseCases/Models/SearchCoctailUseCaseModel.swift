struct SearchCocktailUseCaseModel {

    let id: String
    let thumbnailURL: String?
    let name: String
    let ingredients: String

}

extension SearchCocktailUseCaseModel {

    init(from model: SearchCocktailClientModel) {
        self.id = model.id
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

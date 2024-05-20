struct SearchCoctailUseCaseModel {

    let id: String?
    let thumbnailURL: String?
    let name: String?
    let ingredients: String

    init(from model: SearchCocktailClientModel) {
        self.id = model.id
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

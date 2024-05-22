import Foundation

@testable import Coqtails

class DetailsUseCaseMock: DetailsUseCaseProtocol {

    func fetchCocktailDetails(for cocktailID: String) async throws -> Coqtails.DetailsCocktailUseCaseModel {
        if cocktailID == "11118" {
            throw TestError.genericError("Unable to fetch data")
        }

        return DetailsCocktailUseCaseModel(
            id: "11007",
            name: "Margarita",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
            category: "Ordinary Drink",
            glassType: "Cocktail glass",
            drinkType: "Alcoholic",
            instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it.",
            ingredients: ["Tequila", "Triple sec", "Lime juice", "Salt"],
            lastModified: "2015-08-18 14:42:59")
    }

    func fetchRandomCocktailDetails() async throws -> Coqtails.DetailsCocktailUseCaseModel {
        DetailsCocktailUseCaseModel(
            id: "17216",
            name: "Tommy's Margarita",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg",
            category: "Ordinary Drink",
            glassType: "Old-Fashioned glass",
            drinkType: "Alcoholic",
            instructions: "Shake and strain into a chilled cocktail glass.",
            ingredients: ["Tequila", "Lime juice", "Agave syrup"],
            lastModified: "2015-08-18 14:42:59")
    }

}

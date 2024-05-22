import Foundation
@testable import Coqtails

class SearchUseCaseMock: SearchUseCaseProtocol {

    func searchCocktails(query: String) async throws -> [Coqtails.SearchCocktailUseCaseModel] {
        switch query {
        case "":
            return emptyQuerySearchCocktailUseCaseModels
        case "Margarita":
            return margaritaQuerySearchCocktailUseCaseModels
        case "error":
            throw TestError.genericError("Unable to fetch data")
        default:
            return []
        }
    }

    private let emptyQuerySearchCocktailUseCaseModels = [
        SearchCocktailUseCaseModel(
            id: "12864",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg",
            name: "Apple Cider Punch",
            ingredients: "Apple cider, Brown sugar, Lemonade, Orange juice, Cloves, Allspice, Nutmeg, Cinnamon"),
        SearchCocktailUseCaseModel(
            id: "17222",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
            name: "A1",
            ingredients: "Gin, Grand Marnier, Lemon Juice, Grenadine"),
        SearchCocktailUseCaseModel(
            id: "15997",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg",
            name: "GG",
            ingredients: "Galliano, Ginger ale"),
        SearchCocktailUseCaseModel(
            id: "13501",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg",
            name: "ABC",
            ingredients: "Amaretto, Baileys irish cream, Cognac"),
        SearchCocktailUseCaseModel(
            id: "17225",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg",
            name: "Ace",
            ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White")
    ]

    private let margaritaQuerySearchCocktailUseCaseModels = [
        SearchCocktailUseCaseModel(
            id: "11007",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
            name: "Margarita",
            ingredients: "Tequila, Triple sec, Lime juice, Salt"),
        SearchCocktailUseCaseModel(
            id: "11118",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg",
            name: "Blue Margarita",
            ingredients: "Tequila, Blue Curaca, Lime juice, Salt"),
        SearchCocktailUseCaseModel(
            id: "17216",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg",
            name: "Tommy's Margarita",
            ingredients: "Tequila, Lime Juice, Agave syrup")
    ]

}

import Foundation
@testable import Coqtails

class MockSearchUseCase: SearchUseCaseProtocol {

    func searchCoctails(query: String) async throws -> [Coqtails.SearchCocktailUseCaseModel] {
        switch query {
        case "":
            return emptySearchQueryResponse
        case "Margarita":
            return margaritaSearchQueryResponse
        case "error":
            throw APIError.genericError("Unable to fetch data")
        default:
            return []
        }
    }

    private var emptySearchQueryResponse: [Coqtails.SearchCocktailUseCaseModel] {
        [
            SearchCocktailUseCaseModel(
                id: "12864",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg",
                name: "Apple Cider Punch",
                ingredients: ""),
            SearchCocktailUseCaseModel(
                id: "17222",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
                name: "A1",
                ingredients: "Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass."),
            SearchCocktailUseCaseModel(
                id: "15997",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg",
                name: "GG",
                ingredients: "Pour the Galliano liqueur over ice."),
            SearchCocktailUseCaseModel(
                id: "13501",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg",
                name: "ABC",
                ingredients: ""),
            SearchCocktailUseCaseModel(
                id: "17225",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg",
                name: "Ace",
                ingredients: "")
        ]
    }

    private var margaritaSearchQueryResponse: [Coqtails.SearchCocktailUseCaseModel] {
        [
            SearchCocktailUseCaseModel(
                id: "11007",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
                name: "Margarita",
                ingredients: "Rub the rim of the glass with the lime slice to make the salt stick to it."),
            SearchCocktailUseCaseModel(
                id: "11118",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg",
                name: "Blue Margarita",
                ingredients: "Rub rim of cocktail glass with lime juice. Dip rim in coarse salt."),
            SearchCocktailUseCaseModel(
                id: "17216",
                thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg",
                name: "Tommy's Margarita",
                ingredients: "Shake and strain into a chilled cocktail glass.")
        ]
    }

}

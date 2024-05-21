import Foundation
@testable import Coqtails

class SearchTestModels {

    static let emptySearchQueryCocktailModels = [
        SearchCocktailModel(
            highlightText: "",
            remoteID: "12864",
            thumbnailURL: URL(string:  "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg")!,
            name: "Apple Cider Punch",
            ingredients: "Apple cider, Brown sugar, Lemonade, Orange juice, Cloves, Allspice, Nutmeg, Cinnamon"
        ),
        SearchCocktailModel(
            highlightText: "",
            remoteID: "17222",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg")!,
            name: "A1",
            ingredients: "Gin, Grand Marnier, Lemon Juice, Grenadine"
        ),
        SearchCocktailModel(
            highlightText: "",
            remoteID: "15997",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg")!,
            name: "GG",
            ingredients: "Galliano, Ginger ale"
        ),
        SearchCocktailModel(
            highlightText: "",
            remoteID: "13501",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg")!,
            name: "ABC",
            ingredients: "Amaretto, Baileys irish cream, Cognac"
        ),
        SearchCocktailModel(
            highlightText: "",
            remoteID: "17225",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg")!,
            name: "Ace",
            ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White"
        )
    ]

    static let margaritaSearchQueryCocktailModels = [
         SearchCocktailModel(
            highlightText: "Margarita",
            remoteID: "11007",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")!,
            name: "Margarita",
            ingredients: "Tequila, Triple sec, Lime juice, Salt"),
         SearchCocktailModel(
             highlightText: "Margarita",
             remoteID: "11118",
             thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg")!,
             name: "Blue Margarita",
             ingredients: "Tequila, Blue Curaca, Lime juice, Salt"),
         SearchCocktailModel(
            highlightText: "Margarita",
            remoteID: "17216",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg")!,
            name: "Tommy's Margarita",
            ingredients: "Tequila, Lime Juice, Agave syrup")
    ]

}

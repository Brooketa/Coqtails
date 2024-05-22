import Foundation

@testable import Coqtails

struct FilterTestModels {

    static let allFilterModels = [
        FilterModel(filterType: .category, filterNames: ["Ordinary Drink", "Cocktail", "Shake"]),
        FilterModel(filterType: .glass, filterNames: ["Highball glass", "Cocktail glass", "Old-fashioned glass"]),
        FilterModel(filterType: .alcoholic, filterNames: ["Alcoholic", "Non alhocolic", "Optional alcoholic"])
    ]

    static let categorySelectedFilter = SelectedFilter(filterType: .category, filterName: "Ordinary Drink")
    static let glassSelectedFilter = SelectedFilter(filterType: .glass, filterName: "Highball glass")
    static let alcoholicSelectedFilter = SelectedFilter(filterType: .alcoholic, filterName: "Alcoholic")

    static let allSelectedFilters = [
        FilterTestModels.categorySelectedFilter,
        FilterTestModels.glassSelectedFilter,
        FilterTestModels.alcoholicSelectedFilter
    ]

    static let allFilterResultCocktailModels = [
        FilterResultCocktailModel(
            cocktailID: "12864",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg")!,
            name: "Apple Cider Punch",
            ingredients: "Apple cider, Brown sugar, Lemonade, Orange juice, Cloves, Allspice, Nutmeg, Cinnamon"),
        FilterResultCocktailModel(
            cocktailID: "17222",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg")!,
            name: "A1",
            ingredients: "Gin, Grand Marnier, Lemon Juice, Grenadine"),
        FilterResultCocktailModel(
            cocktailID: "15997",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg"),
            name: "GG",
            ingredients: "Galliano, Ginger ale"),
        FilterResultCocktailModel(
            cocktailID: "13501",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg"),
            name: "ABC",
            ingredients: "Amaretto, Baileys irish cream, Cognac"),
        FilterResultCocktailModel(
            cocktailID: "17225",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg"),
            name: "Ace",
            ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White")
    ]

}

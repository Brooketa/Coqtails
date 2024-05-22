import Foundation

@testable import Coqtails

struct DetailsTestModels {

    static let margaritaDetailsCocktailModel = DetailsCocktailModel(
        id: "11007",
        name: "Margarita",
        thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")!,
        category: "Ordinary Drink",
        glassType: "Cocktail glass",
        drinkType: "Alcoholic",
        instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it.",
        ingredients: ["Tequila", "Triple sec", "Lime juice", "Salt"],
        lastModified: DateFormatter.iso8601NoTDateFormatter.date(from: "2015-08-18 14:42:59")!
    )

    static let randomDetailsCocktailModel = DetailsCocktailModel(
        id: "17216",
        name: "Tommy's Margarita",
        thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg")!,
        category: "Ordinary Drink",
        glassType: "Old-Fashioned glass",
        drinkType: "Alcoholic",
        instructions: "Shake and strain into a chilled cocktail glass.",
        ingredients: ["Tequila", "Lime juice", "Agave syrup"],
        lastModified: DateFormatter.iso8601NoTDateFormatter.date(from: "2015-08-18 14:42:59")!
    )

}

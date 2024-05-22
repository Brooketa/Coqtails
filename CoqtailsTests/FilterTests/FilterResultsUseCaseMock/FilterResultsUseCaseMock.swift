@testable import Coqtails

class FilterResultsUseCaseMock: FilterResultsUseCaseProtocol {

    func fetchFilteredCocktails(
        for selectedFilters: [Coqtails.SelectedFilter]
    ) async throws -> [Coqtails.FilterResultUseCaseModel] {
        guard !selectedFilters.isEmpty else { throw TestError.genericError("Unable to fetch data") }

        return filterResultUseCaseModels
    }

    private let filterResultUseCaseModels = [
        FilterResultUseCaseModel(
            id: "12864",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg",
            name: "Apple Cider Punch",
            ingredients: "Apple cider, Brown sugar, Lemonade, Orange juice, Cloves, Allspice, Nutmeg, Cinnamon"),
        FilterResultUseCaseModel(
            id: "17222",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg",
            name: "A1",
            ingredients: "Gin, Grand Marnier, Lemon Juice, Grenadine"),
        FilterResultUseCaseModel(
            id: "15997",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg",
            name: "GG",
            ingredients: "Galliano, Ginger ale"),
        FilterResultUseCaseModel(
            id: "13501",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg",
            name: "ABC",
            ingredients: "Amaretto, Baileys irish cream, Cognac"),
        FilterResultUseCaseModel(
            id: "17225",
            thumbnailURL: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg",
            name: "Ace",
            ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White")
    ]

}

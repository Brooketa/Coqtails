@testable import Coqtails

class FiltersUseCaseMock: FiltersUseCaseProtocol {

    func fetchCategoryTypes() async throws -> [Coqtails.FilterCategoryTypeUseCaseModel] {
        categoryTypeUseCaseModels
    }

    func fetchGlassTypes() async throws -> [Coqtails.FilterGlassTypeUseCaseModel] {
        glassTypeUseCaseModels
    }

    func fetchAlcoholicTypes() async throws -> [Coqtails.FilterAlcoholicTypeUseCaseModel] {
        alcoholicTypeUseCaseModels
    }

    private let categoryTypeUseCaseModels = [
        FilterCategoryTypeUseCaseModel(filterName: "Ordinary Drink"),
        FilterCategoryTypeUseCaseModel(filterName: "Cocktail"),
        FilterCategoryTypeUseCaseModel(filterName: "Shake")
    ]

    private let glassTypeUseCaseModels = [
        FilterGlassTypeUseCaseModel(filterName: "Highball glass"),
        FilterGlassTypeUseCaseModel(filterName: "Cocktail glass"),
        FilterGlassTypeUseCaseModel(filterName: "Old-fashioned glass")
    ]

    private let alcoholicTypeUseCaseModels = [
        FilterAlcoholicTypeUseCaseModel(filterName: "Alcoholic"),
        FilterAlcoholicTypeUseCaseModel(filterName: "Non alhocolic"),
        FilterAlcoholicTypeUseCaseModel(filterName: "Optional alcoholic")
    ]

}

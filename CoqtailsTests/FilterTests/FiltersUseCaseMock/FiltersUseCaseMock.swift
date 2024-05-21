@testable import Coqtails

class FiltersUseCaseMock: FiltersUseCaseProtocol {

    func fetchCategoryTypes() async throws -> [Coqtails.FilterCategoryTypeUseCaseModel] {
        categoryTypeModels
    }

    func fetchGlassTypes() async throws -> [Coqtails.FilterGlassTypeUseCaseModel] {
        glassTypeModels
    }

    func fetchAlcoholicTypes() async throws -> [Coqtails.FilterAlcoholicTypeUseCaseModel] {
        alcoholicTypeModels
    }

    private var categoryTypeModels = [
        FilterCategoryTypeUseCaseModel(filterName: "Ordinary Drink"),
        FilterCategoryTypeUseCaseModel(filterName: "Cocktail"),
        FilterCategoryTypeUseCaseModel(filterName: "Shake")
    ]

    private var glassTypeModels = [
        FilterGlassTypeUseCaseModel(filterName: "Highball glass"),
        FilterGlassTypeUseCaseModel(filterName: "Cocktail glass"),
        FilterGlassTypeUseCaseModel(filterName: "Old-fashioned glass")
    ]

    private var alcoholicTypeModels = [
        FilterAlcoholicTypeUseCaseModel(filterName: "Alcoholic"),
        FilterAlcoholicTypeUseCaseModel(filterName: "Non alhocolic"),
        FilterAlcoholicTypeUseCaseModel(filterName: "Optional alcoholic")
    ]

}

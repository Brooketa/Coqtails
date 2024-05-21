@testable import Coqtails

struct FiltersTestModels {

    static let allFilterModels = [
        FilterModel(filterType: .category, filterNames: ["Ordinary Drink", "Cocktail", "Shake"]),
        FilterModel(filterType: .glass, filterNames: ["Highball glass", "Cocktail glass", "Old-fashioned glass"]),
        FilterModel(filterType: .alcoholic, filterNames: ["Alcoholic", "Non alhocolic", "Optional alcoholic"])
    ]

    static let categorySelectedFilter = SelectedFilter(filterType: .category, filterName: "Ordinary Drink")
    static let glassSelectedFilter = SelectedFilter(filterType: .glass, filterName: "Highball glass")
    static let alcoholicSelectedFilter = SelectedFilter(filterType: .alcoholic, filterName: "Alcoholic")

    static let allSelectedFilters = [
        FiltersTestModels.categorySelectedFilter,
        FiltersTestModels.glassSelectedFilter,
        FiltersTestModels.alcoholicSelectedFilter
    ]

}

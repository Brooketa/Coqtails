
@MainActor
struct Dependencies {

    var setupSearchViewModel: SearchViewModel {
        let searchClient = SearchClient(baseClient: BaseClient())
        let searchUseCase = SearchUseCase(searchClient: searchClient)

        return SearchViewModel(searchUseCase: searchUseCase)
    }

    var setupDetailsViewModel: DetailsViewModel {
        let detailsClient = DetailsClient(baseClient: BaseClient())
        let detailsUseCase = DetailsUseCase(detailsClient: detailsClient)

        return DetailsViewModel(detailsUseCase: detailsUseCase)
    }

    var setupFiltersViewModel: FiltersViewModel {
        let filtersClient = FiltersClient(baseClient: BaseClient())
        let filtersUseCase = FiltersUseCase(filtersClient: filtersClient)

        return FiltersViewModel(filterUseCase: filtersUseCase)
    }

    var setupFilterResultsViewModel: FilterResultsViewModel {
        let filterResultsClient = FilterResultsClient(baseClient: BaseClient())
        let filterResultsUseCase = FilterResultsUseCase(filterResultsClient: filterResultsClient)

        return FilterResultsViewModel(filterResultsUseCase: filterResultsUseCase)
    }

}

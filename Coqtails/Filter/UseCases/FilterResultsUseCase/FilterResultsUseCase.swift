class FilterResultsUseCase: FilterResultsUseCaseProtocol {

    private let filterResultsClient: FilterResultsClientProtocol

    init(filterResultsClient: FilterResultsClientProtocol) {
        self.filterResultsClient = filterResultsClient
    }

    func fetchFilteredCocktails(for selectedFilters: [SelectedFilter]) async throws -> [FilterResultUseCaseModel] {
        try await filterResultsClient
            .fetchFilteredCocktails(for: selectedFilters)
            .map { FilterResultUseCaseModel(from: $0) }
    }

}

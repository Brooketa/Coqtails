protocol FilterResultsUseCaseProtocol {

    func fetchFilteredCocktails(for selectedFilters:[SelectedFilter]) async throws -> [FilterResultUseCaseModel]

}

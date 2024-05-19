protocol FilterResultsClientProtocol {

    func fetchFilteredCocktails(for selectedFilters:[SelectedFilter]) async throws -> [FilterResultClientModel]

}

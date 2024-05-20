import SwiftUI

class FilterResultsViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<[FilterResultCocktailModel]>.idle

    private let filterResultsUseCase: FilterResultsUseCaseProtocol

    init(filterResultsUseCase: FilterResultsUseCaseProtocol) {
        self.filterResultsUseCase = filterResultsUseCase
    }

    func load() {}

    @MainActor
    func fetchFilteredCocktails(for selectedFilters: [SelectedFilter]) async {
        do {
            state = .loading
            let filteredCocktails = try await filterResultsUseCase
                .fetchFilteredCocktails(for: selectedFilters)
                .map { FilterResultCocktailModel(from: $0) }
            
            state = .loaded(filteredCocktails)
        } catch {
            state = .failed(error)
        }
    }

}

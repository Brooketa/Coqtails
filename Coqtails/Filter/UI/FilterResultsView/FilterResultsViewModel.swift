import SwiftUI

class FilterResultsViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<Int>.idle

    private let filterResultsUseCase: FilterResultsUseCaseProtocol

    init(filterResultsUseCase: FilterResultsUseCaseProtocol) {
        self.filterResultsUseCase = filterResultsUseCase
    }

    func load() {}

    @MainActor func fetchFilteredCocktails(for selectedFilters: [SelectedFilter]) {
        Task(priority: .userInitiated) {
            do {
                let filteredCocktails = try await filterResultsUseCase
                    .fetchFilteredCocktails(for: selectedFilters)
                    .map { FilterResultCocktailModel(from: $0) }

                print(filteredCocktails)
            } catch {
                state = .failed(error)
            }
        }
    }

}

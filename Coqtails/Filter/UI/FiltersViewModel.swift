import Combine
import SwiftUI

class FiltersViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<[FilterModel]>.idle
    @Published var selectedFilters = [SelectedFilter]()
    @Published var resetButtonIsEnabled: Bool = false
    @Published var searchButtonIsEnabled: Bool = false

    private let filterUseCase: FiltersUseCaseProtocol

    private var cancellables = Set<AnyCancellable>()

    init(filterUseCase: FiltersUseCaseProtocol) {
        self.filterUseCase = filterUseCase

        configureSubscriptions()
    }

    func load() {}

    @MainActor
    func fetchAllFilters() {
        Task {
            do {
                state = .loading
                async let categoryFilters = try filterUseCase
                    .fetchCategoryTypes()
                    .map { $0.filterName }
                let categoryModel = FilterModel(filterType: .category, filterNames: try await categoryFilters)

                async let glassFilters = try filterUseCase
                    .fetchGlassTypes()
                    .map { $0.filterName }
                let glassModel = FilterModel(filterType: .glass, filterNames: try await glassFilters)

                async let alcoholicFilters = try filterUseCase
                    .fetchAlcoholicTypes()
                    .map { $0.filterName }
                let alcoholicModel = FilterModel(filterType: .alcoholic, filterNames: try await alcoholicFilters)

                state = .loaded([categoryModel, glassModel, alcoholicModel])
            }
            catch {
                state = .failed(error)
            }
        }
    }

    @MainActor
    func filterTapped(_ filter: SelectedFilter) {
        if let index = selectedFilters.firstIndex(of: filter) {
            selectedFilters.remove(at: index)
        } else {
            selectedFilters.removeAll { selection in
                selection.filterType == filter.filterType
            }
            selectedFilters.append(filter)
        }
    }

    @MainActor
    func resetFilters() {
        selectedFilters.removeAll()
    }

    private func configureSubscriptions() {
        $selectedFilters
            .map { !$0.isEmpty }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] hasSelectedFilters in
                self.resetButtonIsEnabled = hasSelectedFilters
                self.searchButtonIsEnabled = hasSelectedFilters
            }
            .store(in: &cancellables)

        $selectedFilters
            .map { !$0.isEmpty }
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] isSearchButtonEnabled in
                self.searchButtonIsEnabled = isSearchButtonEnabled
            }
            .store(in: &cancellables)
    }

}

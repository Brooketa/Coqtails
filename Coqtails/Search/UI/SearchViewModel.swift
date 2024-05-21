import Combine
import Foundation

class SearchViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<[SearchCocktailModel]>.idle
    @Published var searchText = ""

    private let searchUseCase: SearchUseCaseProtocol

    private var isInitialLoad: Bool = true
    private var cancellables = Set<AnyCancellable>()
    
    init(searchUseCase: SearchUseCaseProtocol) {
        self.searchUseCase = searchUseCase

        configureSubscriptions()
    }

    func load() {}

    private func searchCoctails(query: String) async -> LoadingState<[SearchCocktailModel]> {
            do {
                let coctails = try await searchUseCase
                    .searchCoctails(query: query)
                    .map { SearchCocktailModel(for: searchText, from: $0) }

                return .loaded(coctails)
            } catch {
                return .failed(error)
            }
    }

    private func configureSubscriptions() {
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] query in
                guard let self = self else { return }

                self.state = .loading

                Task(priority: .userInitiated) {
                    let state = await self.searchCoctails(query: query)

                    await MainActor.run {
                        self.state = state
                    }
                }
            }
            .store(in: &cancellables)
    }

}

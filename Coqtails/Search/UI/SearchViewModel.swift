import Combine
import Foundation

class SearchViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<[SearchCocktailModel]>.idle
    @Published var searchText = ""

    private let searchUseCase: SearchUseCaseProtocol

    private var cancellables = Set<AnyCancellable>()
    
    init(searchUseCase: SearchUseCaseProtocol) {
        self.searchUseCase = searchUseCase

        configureSubscriptions()
    }

    private func searchCocktails(query: String) async -> LoadingState<[SearchCocktailModel]> {
            do {
                let cocktails = try await searchUseCase
                    .searchCocktails(query: query)
                    .map { SearchCocktailModel(for: searchText, from: $0) }

                return .loaded(cocktails)
            } catch {
                return .failed(error)
            }
    }

    private func configureSubscriptions() {
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { query in
                self.state = .loading

                Task(priority: .userInitiated) {
                    let state = await self.searchCocktails(query: query)

                    await MainActor.run {
                        self.state = state
                    }
                }
            }
            .store(in: &cancellables)
    }

}

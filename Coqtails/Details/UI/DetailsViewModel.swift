import SwiftUI

class DetailsViewModel: ObservableObject, Loadable {

    @Published var state = LoadingState<DetailsCocktailModel>.idle

    private let detailsUseCase: DetailsUseCaseProtocol

    init(detailsUseCase: DetailsUseCaseProtocol) {
        self.detailsUseCase = detailsUseCase
    }

    func load() {}

    @MainActor
    func fetchCocktailDetails(for cocktailID: String?) async {
        state = .loading

        if let cocktailID = cocktailID {
            state = await fetchDetails(for: cocktailID)
        } else {
            state = await fetchRandomCocktailDetails()
        }
    }

    private func fetchDetails(for cocktailID: String) async -> LoadingState<DetailsCocktailModel> {
        do {
            let details = try await detailsUseCase.fetchCocktailDetails(for: cocktailID)
            let cocktailDetails = DetailsCocktailModel(from: details)

            return .loaded(cocktailDetails)
        } catch {
            return .failed(error)
        }
    }

    private func fetchRandomCocktailDetails() async -> LoadingState<DetailsCocktailModel> {
        do {
            let details = try await detailsUseCase.fetchRandomCocktailDetails()
            let randomCocktailDetails = DetailsCocktailModel(from: details)

            return .loaded(randomCocktailDetails)
        } catch {
            return .failed(error)
        }
    }

}

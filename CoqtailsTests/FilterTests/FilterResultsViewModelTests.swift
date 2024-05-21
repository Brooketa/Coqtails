import XCTest
import CombineExpectations

@testable import Coqtails

final class FilterResultsViewModelTests: XCTestCase {

    var viewModel: FilterResultsViewModel!

    override func setUp() {
        viewModel = FilterResultsViewModel(filterResultsUseCase: FilterResultsUseCaseMock())
    }

    func testInitialLoadStateIsIdle() {
        XCTAssertEqual(viewModel.state, .idle)
    }

    func testSuccessFetchFilteredCocktailsForAllFilters() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchFilteredCocktails(for: FiltersTestModels.allSelectedFilters)
        }

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil }.record()
        try wait(for: recorder.next())

        let state = viewModel.state

        XCTAssertEqual(state.items, FiltersTestModels.allFilterResultCocktailModels)
    }

    func testFetchFilteredCocktailsFailed() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchFilteredCocktails(for: [])
        }
    
        let recorder = viewModel.$state.map(\.error).filter { $0 != nil }.record()
        try wait(for: recorder.next())

        let state = viewModel.state

        XCTAssertEqual(state, .failed(APIError.genericError("Unable to fetch data")))
    }

    func testSuccessStateSetToLoading() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchFilteredCocktails(for: FiltersTestModels.allSelectedFilters)
        }

        let recorder = viewModel.$state.dropFirst().record()
        try wait(for: recorder.next())

        let state = viewModel.state

        XCTAssertEqual(state, .loading)
    }

}

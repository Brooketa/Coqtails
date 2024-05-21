import XCTest
import CombineExpectations

@testable import Coqtails

final class SearchViewModelTest: XCTestCase {

    var viewModel: SearchViewModel!

    override func setUp() {
        viewModel = SearchViewModel(searchUseCase: SearchUseCaseMock())
    }

    func testInitialLoadStateIsIdle() {
        XCTAssertEqual(viewModel.state, .idle)
    }

    func testSuccessEmptySearchQuery() throws {
        XCTAssertEqual(viewModel.state, .idle)

        viewModel.searchText = ""

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state.items, SearchTestModels.emptySearchQueryCocktailModels)
    }

    func testSuccessMargaritaSearchQuery() throws {
        XCTAssertEqual(viewModel.state, .idle)

        viewModel.searchText = "Margarita"

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state.items, SearchTestModels.margaritaSearchQueryCocktailModels)
    }

    func testSearchQueryFailed() throws {
        XCTAssertEqual(viewModel.state, .idle)

        viewModel.searchText = "error"

        let recorder = viewModel.$state.map(\.error).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state, .failed(APIError.genericError("Unable to fetch data")))
    }

    func testSuccessStateSetToLoading() throws {
        XCTAssertEqual(viewModel.state, .idle)

        viewModel.searchText = "loading test query"

        let recorder = viewModel.$state.dropFirst().record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state, .loading)
    }

}

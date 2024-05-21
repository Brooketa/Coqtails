import Combine
import XCTest
import CombineExpectations

@testable import Coqtails

final class DetailsViewModelTests: XCTestCase {

    var viewModel: DetailsViewModel!

    override func setUp() {
        viewModel = DetailsViewModel(detailsUseCase: DetailsUseCaseMock())
    }

    func testInitialLoadStateIsIdle() {
        XCTAssertEqual(viewModel.state, .idle)
    }

    func testSuccessFetchMargaritaCocktailDetails() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchCocktailDetails(for: "11007")
        }

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state.items, DetailsTestModels.margaritaDetailsCocktailModel)
    }

    func testSuccessFetchRandomCocktailDetails() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchCocktailDetails(for: nil)
        }

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state.items, DetailsTestModels.randomDetailsCocktailModel)
    }

    func testFetchCocktailDetailsFailed() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchCocktailDetails(for: "11118")
        }

        let recorder = viewModel.$state.map(\.error).filter { $0 != nil }.record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state, .failed(APIError.genericError("Unable to fetch data")))
    }

    func testSuccessStateSetToLoading() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchCocktailDetails(for: "11007")
        }

        let recorder = viewModel.$state.dropFirst().record()
        _ = try wait(for: recorder.next(), timeout: 2)

        let state = viewModel.state

        XCTAssertEqual(state, .loading)
    }

}

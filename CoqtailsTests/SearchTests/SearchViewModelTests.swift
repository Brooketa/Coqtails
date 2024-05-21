import Combine
import XCTest

@testable import Coqtails

final class SearchViewModelTest: XCTestCase {

    var cancellables = Set<AnyCancellable>()

    func testInitialLoadStateIsIdle() {
        let viewModel = SearchViewModel(searchUseCase: MockSearchUseCase())
        let expectation = XCTestExpectation(description: "State should be set to .idle")

        if case .idle = viewModel.state {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testSuccessEmptySearchQuery() throws {
        let viewModel = SearchViewModel(searchUseCase: MockSearchUseCase())
        let expectation = XCTestExpectation(description: "State should be set to .loaded with cocktails")

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .loaded(models) = state {
                    let firstModel = models[0]
                    let lastModel = models[4]

                    XCTAssertEqual(viewModel.searchText, "")

                    XCTAssertTrue(models.count == 5, "Cocktail count should be 5 for succesfull a response")

                    XCTAssertTrue(firstModel.remoteID == "12864")
                    XCTAssertTrue(firstModel.name == "Apple Cider Punch")

                    XCTAssertTrue(lastModel.remoteID == "17225")
                    XCTAssertTrue(lastModel.name == "Ace")

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = ""

        wait(for: [expectation], timeout: 1)
    }

    func testSuccessMargaritaSearchQuery() {
        let viewModel = SearchViewModel(searchUseCase: MockSearchUseCase())
        let expectation = XCTestExpectation(description: "State should be set to .loaded with Margarita cocktails")

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .loaded(models) = state {
                    let firstModel = models[0]
                    let lastModel = models[2]

                    XCTAssertTrue(models.count == 3, "Cocktail count should be: 3")
                    
                    XCTAssertTrue(firstModel.remoteID == "11007", "Expected ID: 11007")
                    XCTAssertTrue(firstModel.name == "Margarita", "Expected name: Margarita")

                    XCTAssertTrue(lastModel.remoteID == "17216", "Expected ID: 17216")
                    XCTAssertTrue(lastModel.name == "Tommy's Margarita", "Expected name: Tommy's Margarita")

                    XCTAssertEqual(viewModel.searchText, "Margarita")

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = "Margarita"

        wait(for: [expectation], timeout: 1)
    }

    func testSearchQueryFailed() {
        let viewModel = SearchViewModel(searchUseCase: MockSearchUseCase())
        let expectation = XCTestExpectation(description: "State should be set to .failed(error)")

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .failed(error) = state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = "error"

        wait(for: [expectation], timeout: 1)
    }

    func testSuccessStateSetToLoading() {
        let viewModel = SearchViewModel(searchUseCase: MockSearchUseCase())
        let expectation = XCTestExpectation(description: "State should be set to .loading")

        viewModel
            .$state
            .dropFirst()
            .sink { state in
                if case .loading = state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = ""

        wait(for: [expectation], timeout: 1)
    }

}

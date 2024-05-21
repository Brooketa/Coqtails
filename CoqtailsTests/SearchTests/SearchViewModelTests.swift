import Combine
import XCTest

@testable import Coqtails

final class SearchViewModelTest: XCTestCase {

    let viewModel = SearchViewModel(searchUseCase: SearchUseCaseMock())

    var cancellables = Set<AnyCancellable>()

    func testInitialLoadStateIsIdle() {
        let expectation = XCTestExpectation(description: "State should be set to .idle")

        if case .idle = viewModel.state {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testSuccessEmptySearchQuery() {
        let expectation = XCTestExpectation(description: "State should be set to .loaded with cocktails")

        let searchText = ""

        let firstModel = SearchCocktailModel(
            highlightText: searchText,
            remoteID: "12864",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/xrqxuv1454513218.jpg")!,
            name: "Apple Cider Punch",
            ingredients: "Apple cider, Brown sugar, Lemonade, Orange juice, Cloves, Allspice, Nutmeg, Cinnamon")

        let lastModel = SearchCocktailModel(
            highlightText: searchText,
            remoteID: "17225",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg")!,
            name: "Ace",
            ingredients: "Gin, Grenadine, Heavy cream, Milk, Egg White")

        viewModel
            .$state
            .dropFirst()
            .sink { [unowned self] state in
                if case let .loaded(models) = state {
                    let firstFetchedModel = models[0]
                    let lastFetchedModel = models[4]
                    XCTAssertEqual(self.viewModel.searchText, searchText)

                    XCTAssertTrue(models.count == 5, "Cocktail count should be 5 for succesfull a response")

                    XCTAssertTrue(firstFetchedModel.highlightText == firstModel.highlightText)
                    XCTAssertTrue(firstFetchedModel.remoteID == firstModel.remoteID)
                    XCTAssertTrue(firstFetchedModel.thumbnailURL == firstModel.thumbnailURL)
                    XCTAssertTrue(firstFetchedModel.name == firstModel.name)
                    XCTAssertTrue(firstFetchedModel.ingredients == firstModel.ingredients)

                    XCTAssertTrue(lastFetchedModel.highlightText == lastModel.highlightText)
                    XCTAssertTrue(lastFetchedModel.remoteID == lastModel.remoteID)
                    XCTAssertTrue(lastFetchedModel.thumbnailURL == lastModel.thumbnailURL)
                    XCTAssertTrue(lastFetchedModel.name == lastModel.name)
                    XCTAssertTrue(lastFetchedModel.ingredients == lastModel.ingredients)

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = searchText

        wait(for: [expectation], timeout: 2)
    }

    func testSuccessMargaritaSearchQuery() {
        let expectation = XCTestExpectation(description: "State should be set to .loaded with Margarita cocktails")

        let searchText = "Margarita"

        let firstModel = SearchCocktailModel(
            highlightText: searchText,
            remoteID: "11007",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")!,
            name: "Margarita",
            ingredients: "Tequila, Triple sec, Lime juice, Salt")

        let lastModel = SearchCocktailModel(
            highlightText: searchText,
            remoteID: "17216",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg")!,
            name: "Tommy's Margarita",
            ingredients: "Tequila, Lime Juice, Agave syrup")

        viewModel
            .$state
            .dropFirst(2)
            .sink { [unowned self] state in
                if case let .loaded(models) = state {
                    let firstFetchedModel = models[0]
                    let lastFetchedModel = models[2]

                    XCTAssertEqual(self.viewModel.searchText, searchText)

                    XCTAssertTrue(models.count == 3, "Cocktail count should be: 3")

                    XCTAssertTrue(firstFetchedModel.highlightText == firstModel.highlightText)
                    XCTAssertTrue(firstFetchedModel.remoteID == firstModel.remoteID)
                    XCTAssertTrue(firstFetchedModel.thumbnailURL == firstModel.thumbnailURL)
                    XCTAssertTrue(firstFetchedModel.name == firstModel.name)
                    XCTAssertTrue(firstFetchedModel.ingredients == firstModel.ingredients)

                    XCTAssertTrue(lastFetchedModel.highlightText == lastModel.highlightText)
                    XCTAssertTrue(lastFetchedModel.remoteID == lastModel.remoteID)
                    XCTAssertTrue(lastFetchedModel.thumbnailURL == lastModel.thumbnailURL)
                    XCTAssertTrue(lastFetchedModel.name == lastModel.name)
                    XCTAssertTrue(lastFetchedModel.ingredients == lastModel.ingredients)

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = searchText

        wait(for: [expectation], timeout: 1)
    }

    func testSearchQueryFailed() {
        let expectation = XCTestExpectation(description: "State should be set to .failed(error)")

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case .failed(_) = state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.searchText = "error"

        wait(for: [expectation], timeout: 1)
    }

    func testSuccessStateSetToLoading() {
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

        viewModel.searchText = "loading test query"

        wait(for: [expectation], timeout: 1)
    }

}

import Combine
import XCTest

@testable import Coqtails

final class DetailsViewModelTests: XCTestCase {

    let viewModel = DetailsViewModel(detailsUseCase: DetailsUseCaseMock())

    var cancellables = Set<AnyCancellable>()

    func testInitialLoadStateIsIdle() {
        let expectation = XCTestExpectation(description: "State should be set to .idle")

        if case .idle = viewModel.state {
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func testFetchCocktailDetailsSuccess() {
        let expectation = XCTestExpectation(description: "State should be set to .loaded with cocktail details")

        let details = DetailsCocktailModel(
            id: "11007",
            name: "Margarita",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg")!,
            category: "Ordinary Drink",
            glassType: "Cocktail glass",
            drinkType: "Alcoholic",
            instructions: "Rub the rim of the glass with the lime slice to make the salt stick to it.",
            ingredients: ["Tequila", "Triple sec", "Lime juice", "Salt"],
            lastModified: DateFormatter.iso8601NoTDateFormatter.date(from: "2015-08-18 14:42:59")!)

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .loaded(fetchedDetails) = state {
                    XCTAssertEqual(fetchedDetails.id, details.id)
                    XCTAssertEqual(fetchedDetails.name, details.name)
                    XCTAssertEqual(fetchedDetails.thumbnailURL, details.thumbnailURL)
                    XCTAssertEqual(fetchedDetails.category, details.category)
                    XCTAssertEqual(fetchedDetails.glassType, details.glassType)
                    XCTAssertEqual(fetchedDetails.drinkType, details.drinkType)
                    XCTAssertEqual(fetchedDetails.instructions, details.instructions)
                    XCTAssertEqual(fetchedDetails.ingredients, details.ingredients)
                    XCTAssertEqual(fetchedDetails.lastModified, details.lastModified)

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        Task {
            await viewModel.fetchCocktailDetails(for: "11007")
        }

        wait(for: [expectation], timeout: 1)
    }

    func testFetchRandomCocktailDetailsSuccess() {
        let expectation = XCTestExpectation(description: "State should be set to .loaded with cocktail details")

        let details = DetailsCocktailModel(
            id: "17216",
            name: "Tommy's Margarita",
            thumbnailURL: URL(string: "https://www.thecocktaildb.com/images/media/drink/loezxn1504373874.jpg")!,
            category: "Ordinary Drink",
            glassType: "Old-Fashioned glass",
            drinkType: "Alcoholic",
            instructions: "Shake and strain into a chilled cocktail glass.",
            ingredients: ["Tequila", "Lime juice", "Agave syrup"],
            lastModified: DateFormatter.iso8601NoTDateFormatter.date(from: "2015-08-18 14:42:59")!)

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .loaded(fetchedDetails) = state {
                    XCTAssertEqual(fetchedDetails.id, details.id)
                    XCTAssertEqual(fetchedDetails.name, details.name)
                    XCTAssertEqual(fetchedDetails.thumbnailURL, details.thumbnailURL)
                    XCTAssertEqual(fetchedDetails.category, details.category)
                    XCTAssertEqual(fetchedDetails.glassType, details.glassType)
                    XCTAssertEqual(fetchedDetails.drinkType, details.drinkType)
                    XCTAssertEqual(fetchedDetails.instructions, details.instructions)
                    XCTAssertEqual(fetchedDetails.ingredients, details.ingredients)
                    XCTAssertEqual(fetchedDetails.lastModified, details.lastModified)

                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        Task {
            await viewModel.fetchCocktailDetails(for: nil)
        }

        wait(for: [expectation], timeout: 1)
    }

    func testFetchCocktailDetailsFailed() {
        let expectation = XCTestExpectation(description: "State should be set to .loaded with cocktail details")

        viewModel
            .$state
            .dropFirst(2)
            .sink { state in
                if case let .failed(error) = state {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        Task {
            await viewModel.fetchCocktailDetails(for: "11118")
        }

        wait(for: [expectation], timeout: 1)
    }

    func testStateSetToLoadingSuccess() {
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

        Task {
            await viewModel.fetchCocktailDetails(for: "11007")
        }

        wait(for: [expectation], timeout: 1)
    }

}

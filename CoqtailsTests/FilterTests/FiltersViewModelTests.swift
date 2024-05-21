import XCTest
import CombineExpectations
@testable import Coqtails

final class FiltersViewModelTests: XCTestCase {

    var viewModel: FiltersViewModel!

    override func setUp() {
        viewModel = FiltersViewModel(filterUseCase: FiltersUseCaseMock())
    }

    func testInitialLoadStateIsIdle() {
        XCTAssertEqual(viewModel.state, .idle)
    }

    func testSuccessFetchAllFilters() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchAllFilters()
        }

        let recorder = viewModel.$state.map(\.items).filter { $0 != nil } .record()
        try wait(for: recorder.next())

        let state = viewModel.state

        XCTAssertEqual(state.items, FiltersTestModels.allFilterModels)
    }

    func testSuccessAddSelectedFilters() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.glassSelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.alcoholicSelectedFilter)
        }

        let recorder = viewModel.$selectedFilters.record()
        try wait(for: recorder.availableElements)

        let selectedFilters = viewModel.selectedFilters

        XCTAssertEqual(selectedFilters, FiltersTestModels.allSelectedFilters)
    }

    func testSuccessAddAndRemoveSelectedFilters() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.glassSelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.alcoholicSelectedFilter)

            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.glassSelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.alcoholicSelectedFilter)
        }

        let recorder = viewModel.$selectedFilters.record()
        try wait(for: recorder.availableElements)

        let selectedFilters = viewModel.selectedFilters

        XCTAssertEqual(selectedFilters, [])
    }

    func testSuccessResetButtonIsEnabled() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
        }

        let recorder = viewModel.$resetButtonIsEnabled.filter { $0 == true } .record()
        try wait(for: recorder.next())

        let isResetButtonEnabled = viewModel.resetButtonIsEnabled

        XCTAssertTrue(isResetButtonEnabled)
    }

    func testSuccessSearchButtonIsEnabled() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
        }

        let recorder = viewModel.$searchButtonIsEnabled.filter { $0 == true } .record()
        try wait(for: recorder.next())

        let isSearchButtonEnabled = viewModel.searchButtonIsEnabled
        XCTAssertTrue(isSearchButtonEnabled)
    }

    func testResetButtonIsEnabledFailed() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
        }

        let recorder = viewModel.$resetButtonIsEnabled.filter { $0 == false } .record()
        try wait(for: recorder.next())

        let isResetButtonEnabled = viewModel.resetButtonIsEnabled

        XCTAssertFalse(isResetButtonEnabled)
    }

    func testSearchButtonIsEnabledFailed() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
            await viewModel.filterTapped(FiltersTestModels.categorySelectedFilter)
        }

        let recorder = viewModel.$resetButtonIsEnabled.filter { $0 == false } .record()
        try wait(for: recorder.next())

        let isResetButtonEnabled = viewModel.searchButtonIsEnabled

        XCTAssertFalse(isResetButtonEnabled)
    }

    func testSuccessStateSetToLoading() throws {
        XCTAssertEqual(viewModel.state, .idle)

        Task {
            await viewModel.fetchAllFilters()
        }

        let recorder = viewModel.$state.dropFirst().record()
        try wait(for: recorder.next())

        let state = viewModel.state

        XCTAssertEqual(state, .loading)
    }

}

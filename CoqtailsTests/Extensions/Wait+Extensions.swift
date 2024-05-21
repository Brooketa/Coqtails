import XCTest
import CombineExpectations

public extension XCTestCase {

    @discardableResult
    func wait<R: PublisherExpectation>(
        for publisherExpectation: R,
        description: String = ""
    ) throws -> R.Output {
        try wait(for: publisherExpectation, timeout: 2, description: description)
    }

}


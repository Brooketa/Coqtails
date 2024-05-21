@testable import Coqtails

extension LoadingState: Equatable {

    public static func == (lhs: Coqtails.LoadingState<Value>, rhs: Coqtails.LoadingState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading), (.failed, .failed): return true
        case (.loaded(let value1), .loaded(let value2)): return value1 == value2
        default: return false
        }
    }

}

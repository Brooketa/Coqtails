import Foundation

enum LoadingState<Value: Equatable> {

    case idle
    case loading
    case failed(Error)
    case loaded(Value)

    var items: Value? {
        switch self {
        case .idle, .loading, .failed: return nil
        case .loaded(let value): return value
        }
    }

    var error: Error? {
        switch self {
        case .idle, .loading, .loaded: return nil
        case .failed(let error): return error
        }
    }

}

protocol Loadable: ObservableObject {

    associatedtype Output: Equatable
    var state: LoadingState<Output> { get set }
    @MainActor
    func load()

}

extension Loadable {

    func load() {}

}

import Foundation

enum LoadingState<Value> {

  case idle
  case loading
  case failed(Error)
  case loaded(Value)

}

protocol Loadable: ObservableObject {

  associatedtype Output
  var state: LoadingState<Output> { get set }
  @MainActor
  func load()

}

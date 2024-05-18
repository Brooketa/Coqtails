import SwiftUI

struct AsyncContentView<
  Source: Loadable,
  LoadingView: View,
  Content: View
>: View {

  @ObservedObject var source: Source
  @Environment(\.dismiss) var dismiss

  var loadingView: LoadingView
  @ViewBuilder
  var content: (Source.Output) -> Content

  var body: some View {
    switch source.state {
    case .idle:
      Color.clear.onAppear(perform: source.load)
    case .loading:
      loadingView
    case .failed(let error):
        ErrorPopoverView(text: error.localizedDescription) {
          dismiss()
        }
    case .loaded(let output):
      content(output)
    }
  }

}

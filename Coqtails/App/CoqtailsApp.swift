import SwiftUI

@main
struct CoqtailsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dependencies: Dependencies())
        }
    }

    private struct ContentView: View {
        @Environment(\.dependencies) var dependencies

        var body: some View {
            SearchView(viewModel: dependencies.setupSearchViewModel)
        }
    }
}

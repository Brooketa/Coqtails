import SwiftUI

struct SearchView: View {

    @StateObject var viewModel = SearchViewModel(searchUseCase: SearchUseCase(searchClient: SearchClient(baseClient: BaseClient())))
    @StateObject var navigationPathManager = NavigationPathManager()

    @State private var shouldFocusSearchTextField: Bool = false

    var body: some View {
        NavigationStack(path: $navigationPathManager.navigationPath) {
            VStack(spacing: 0) {
                AsyncContentView(source: viewModel, loadingView: LoadingView()) { coctails in

                    HStack(spacing: 15) {
                        SearchBarView(
                            searchText: $viewModel.searchText,
                            shouldBeFocused: $shouldFocusSearchTextField
                        )

                        if viewModel.searchText.isEmpty && !shouldFocusSearchTextField {
                            filterButton
                        }
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                    .offset(y: 5)
                    .background(Color.primaryAccentColor)
                    .animation(.easeInOut(duration: 0.2), value: shouldFocusSearchTextField)

                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(coctails) { coctail in
                                CoctailListItemView(model: coctail)
                                    .onTapGesture {
                                        navigationPathManager
                                            .navigationPath
                                            .append(SearchNavigationDestination.details(coctail.remoteID))
                                    }
                            }
                        }
                        .padding(.bottom, 40)
                    }
                    .overlay(alignment: .bottom) {
                        feelingLuckyButton
                    }
                    .ignoresSafeArea(.keyboard)

                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: SearchNavigationDestination.self) { destination in
                switch destination {
                case .details(let cocktailID):
                    DetailsView(cocktailID: cocktailID)
                        .environmentObject(navigationPathManager)
                case .filters:
                    FiltersView()
                        .environmentObject(navigationPathManager)
                }
            }
        }
    }

    private var filterButton: some View {
        Button {
            navigationPathManager.navigationPath.append(SearchNavigationDestination.filters)
        } label: {
            Image("filter", bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
        }
        .transition(.opacity)
    }

    private var feelingLuckyButton: some View {
        Button {
            navigationPathManager.navigationPath.append(SearchNavigationDestination.details(nil))
        } label: {
            Text("FEELING LUCKY")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(height: 30)
                .padding(.horizontal, 30)
        }
        .buttonStyle(.borderedProminent)
        .tint(.primaryAccentColor)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.bottom, 10)
    }

}

extension CoctailListItemView {

    init(model: SearchCocktailModel) {
        self.highlightText = model.highlightText
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.instructions = model.instructions
    }

}

#Preview {
    SearchView()
}

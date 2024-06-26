import SwiftUI

struct SearchView: View {

    @Environment(\.dependencies) var dependencies

    @StateObject var navigationPathManager = NavigationPathManager()

    @StateObject private var viewModel: SearchViewModel

    @State private var shouldFocusSearchTextField: Bool = false

    init(viewModel: SearchViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack(path: $navigationPathManager.navigationPath) {
            VStack(spacing: 0) {
                AsyncContentView(source: viewModel, loadingView: LoadingView()) { cocktails in

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
                            ForEach(cocktails) { cocktail in
                                CocktailListItemView(model: cocktail)
                                    .onTapGesture {
                                        navigationPathManager
                                            .navigationPath
                                            .append(SearchNavigationDestination.details(cocktail.cocktailID))
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
            .background(Color.primaryBackground)
            .toolbar(.hidden, for: .navigationBar)
            .navigationDestination(for: SearchNavigationDestination.self) { destination in
                switch destination {
                case .details(let cocktailID):
                    DetailsView(viewModel: dependencies.setupDetailsViewModel, cocktailID: cocktailID)
                        .environmentObject(navigationPathManager)
                case .filters:
                    FiltersView(viewModel: dependencies.setupFiltersViewModel)
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

extension CocktailListItemView {

    init(model: SearchCocktailModel) {
        self.highlightText = model.highlightText
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.ingredients = model.ingredients
    }

}

import SwiftUI

struct FilterResultsView: View {

    @EnvironmentObject private var navigationPathManager: NavigationPathManager

    @StateObject private var viewModel: FilterResultsViewModel

    private let selectedFilters: [SelectedFilter]

    init(viewModel: FilterResultsViewModel, selectedFilters: [SelectedFilter]) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.selectedFilters = selectedFilters
    }

    var body: some View {
        VStack(spacing: 0) {
            AsyncContentView(source: viewModel, loadingView: LoadingView()) { cocktails in
                HStack {

                    Button {
                        navigationPathManager.navigationPath = .init()
                    } label: {
                        Image("back")
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    .padding(.horizontal, 20)

                    Spacer()

                }
                .frame(height:44)
                .frame(maxWidth: .infinity)
                .background(Color.primaryAccentColor)
                .overlay(alignment: .center) {

                    Text("Filter results")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)

                }

                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(cocktails) { cocktail in
                            CocktailListItemView(model: cocktail)
                                .onTapGesture {
                                    navigationPathManager
                                        .navigationPath
                                        .append(FilterNavigationDestination.details(cocktail.cocktailID))
                                }
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .background(Color.primaryBackground)
        .navigationBarBackButtonHidden()
        .task {
            guard case .idle = viewModel.state  else { return }

            await viewModel.fetchFilteredCocktails(for: selectedFilters)
        }
    }

}

extension CocktailListItemView {

    init(model: FilterResultCocktailModel) {
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.ingredients = model.ingredients

        self.highlightText = ""
    }

}

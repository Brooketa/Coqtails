import SwiftUI

struct FilterResultsView: View {

    @EnvironmentObject private var navigationPathManager: NavigationPathManager

    @StateObject var viewModel = FilterResultsViewModel(filterResultsUseCase: FilterResultsUseCase(filterResultsClient: FilterResultsClient(baseClient: BaseClient())))

    let selectedFilters: [SelectedFilter]

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
                            CoctailListItemView(model: cocktail)
                                .onTapGesture {
                                    navigationPathManager
                                        .navigationPath
                                        .append(FilterNavigationDestination.details(cocktail.remoteID))
                                }
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            guard case .idle = viewModel.state  else { return }

            viewModel.fetchFilteredCocktails(for: selectedFilters)
        }
    }
}

extension CoctailListItemView {

    init(model: FilterResultCocktailModel) {
        self.highlightText = ""
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.instructions = model.instructions
    }

}

#Preview {
    FilterResultsView(selectedFilters: [])
}
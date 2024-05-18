import SwiftUI

struct FiltersView: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel = FiltersViewModel(filterUseCase: FiltersUseCase(filterClient: FiltersClient(baseClient: BaseClient())))

    var body: some View {
        VStack(spacing: 0) {
            AsyncContentView(source: viewModel, loadingView: LoadingView()) { filters in
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .frame(width: 20, height: 30)
                    }
                    .padding(.horizontal, 20)

                    Spacer()

                    Button {
                        if viewModel.resetButtonIsEnabled {
                            viewModel.resetFilters()
                        }
                    } label: {
                        Text("Reset")
                            .font(.system(size: 17))
                            .fontWeight(viewModel.resetButtonIsEnabled ? .semibold : .light)
                            .foregroundStyle(.white)
                            .opacity(viewModel.resetButtonIsEnabled ? 1.0 : 0.5)
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height:44)
                .frame(maxWidth: .infinity)
                .background(Color.primaryAccentColor)
                .overlay(alignment: .center) {
                    Text("Filters")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 50)
                }

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(filters) { filter in
                            Section {
                                Text(filter.filterType.rawValue)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 20)

                                ForEach(filter.filterNames, id: \.self) { filterName in
                                    let currentFilter = SelectedFilter(
                                        filterType: filter.filterType,
                                        filterName: filterName)

                                    let isFilterSelected = viewModel.selectedFilters.contains(currentFilter)

                                    FilterListItemView(isSelected: isFilterSelected, filterName: filterName)
                                        .onTapGesture {
                                            viewModel.filterTapped(currentFilter)
                                        }
                                }

                                Divider()
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
                .overlay(alignment: .bottom) {
                    searchButton
                }
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchAllFilters()
        }
    }

    private var searchButton: some View {
        Button {
            if viewModel.searchButtonIsEnabled {
                //TODO: Handle button tap
            }
        } label: {
            Text("SEARCH")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(height: 30)
                .frame(maxWidth: .infinity)
                .contentShape(RoundedRectangle(cornerRadius: 30))
        }
        .buttonStyle(.plain)
        .disabled(viewModel.searchButtonIsEnabled ? false : true)
        .background {
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(viewModel.searchButtonIsEnabled ? Color.primaryAccentColor : Color.buttonDisabledColor)
                .frame(height: 50)
        }
        .padding(.horizontal, 30)
        .padding(.bottom, 10)
    }

}

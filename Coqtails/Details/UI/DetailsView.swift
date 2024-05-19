import CoreText
import SwiftUI
import UIKit
import Kingfisher

struct DetailsView: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject private var viewModel = DetailsViewModel(detailsUseCase: DetailsUseCase(detailsClient: DetailsClient(baseClient: BaseClient())))

    @State private var scrollViewSize: CGSize = .zero

    let cocktailID: String?

    init(cocktailID: String?) {
        self.cocktailID = cocktailID
    }

    var body: some View {
        VStack(spacing: 0) {
            AsyncContentView(source: viewModel, loadingView: LoadingView()) { cocktail in
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

                }
                .frame(height:44)
                .frame(maxWidth: .infinity)
                .background(Color.primaryAccentColor)
                .overlay(alignment: .center) {

                    Text(cocktail.name ?? "")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }

                ScrollView {
                    ZStack {
                        VStack {
                            KFImage(cocktail.thumbnailURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)

                            Spacer()
                        }

                        VStack(alignment: .leading, spacing: 20) {
                            DetailsCategoriesView(
                                categoryType: cocktail.category,
                                glassType: cocktail.glassType,
                                alcoholicType: cocktail.drinkType
                            )
                            .padding(.top, 20)
                            .padding(.horizontal, 20)

                            Divider()

                            DetailsIngredientsView(ingredients: cocktail.ingredients)
                                .padding(.horizontal, 20)

                            Divider()
                                .padding(.horizontal, 20)

                            DetailsDirectionsView(directions: cocktail.instructions ?? "")
                                .padding(.horizontal, 20)
                                .frame(height: 100)
                                .frame(maxHeight: .infinity)


                            Divider()
                                .padding(.horizontal, 20)

                            DetailsLastModifiedView(lastModified: cocktail.lastModified)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)

                        }
                        .background {
                            Color(.primaryBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding(.top, scrollViewSize.width * 0.75)
                        .frame(maxHeight: .infinity)
                    }
                }
                .scrollIndicators(.hidden)
                .saveSize(in: $scrollViewSize)
            }
        }
        .background(Color.primaryBackground)
        .navigationBarBackButtonHidden()
        .task {
            viewModel.fetchCocktailDetails(for: cocktailID)
        }
    }

}

import CoreText
import SwiftUI
import UIKit
import Kingfisher

struct DetailsView: View {

    @EnvironmentObject private var navigationPathManager: NavigationPathManager

    @StateObject private var viewModel: DetailsViewModel

    @State private var scrollViewSize: CGSize = .zero

    let cocktailID: String?

    init(viewModel: DetailsViewModel, cocktailID: String?) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.cocktailID = cocktailID
    }

    var body: some View {
        VStack(spacing: 0) {
            AsyncContentView(source: viewModel, loadingView: LoadingView()) { cocktail in
                HStack {

                    Button {
                        navigationPathManager.navigationPath.removeLast()
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

                    Text(cocktail.name)
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

                            Divider()

                            DetailsIngredientsView(ingredients: cocktail.ingredients)

                            Divider()
                                .padding(.horizontal, 20)

                            DetailsDirectionsView(directions: cocktail.instructions ?? "")

                            Divider()
                                .padding(.horizontal, 20)

                            DetailsLastModifiedView(lastModified: cocktail.lastModified)

                        }
                        .background {
                            Color(.primaryBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .padding(.top, scrollViewSize.width * 0.75)
                    }
                }
                .scrollIndicators(.hidden)
                .saveSize(in: $scrollViewSize)
            }
        }
        .background(Color.primaryBackground)
        .navigationBarBackButtonHidden()
        .task {
            await viewModel.fetchCocktailDetails(for: cocktailID)
        }
    }

}

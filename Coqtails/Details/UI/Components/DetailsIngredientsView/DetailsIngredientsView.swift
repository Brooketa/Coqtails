import SwiftUI

struct DetailsIngredientsView: View {

    let ingredients: [String]

    var body: some View {
        VStack {
            Text("Ingredients: ")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)

            ForEach(ingredients, id: \.self) { ingredient in
                HStack {
                    Text("•")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)

                    Text(ingredient)
                        .font(.callout)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding(.horizontal, 20)
    }

}

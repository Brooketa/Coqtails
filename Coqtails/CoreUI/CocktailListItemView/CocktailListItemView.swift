import SwiftUI
import Kingfisher

struct CoctailListItemView: View {

    let model: SearchCocktailModel

    var body: some View {
        HStack(spacing: 30) {
            KFImage(model.thumbnailURL)
                .placeholder {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 73, height: 87)
                        .foregroundStyle(.gray)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 73, height: 87)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            VStack(alignment: .leading){
                if model.highlightText.isEmpty {
                    regularCocktailName
                } else {
                    highlightedCoctailName
                }

                Text(model.instructions.components(separatedBy: ".").first ?? "")
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(20)

        Divider()
            .padding(.horizontal, 20)
    }

    private var regularCocktailName: some View {
        Text(model.name)
            .font(.subheadline)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var highlightedCoctailName: some View {
        Text(attributedCocktailName)
            .font(.subheadline)
            .fontWeight(.light)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var attributedCocktailName: AttributedString {
        let cocktailNameLower = model.name.lowercased()
        guard
            let range = cocktailNameLower.range(of: model.highlightText.lowercased()),
            model.highlightText.trimmingCharacters(in: .whitespaces).isEmpty == false
        else {
            return AttributedString(model.name)
        }

        var cocktailName = model.name
        cocktailName.insert(contentsOf: "**", at: range.upperBound)
        cocktailName.insert(contentsOf: "**", at: range.lowerBound)

        guard let attributedCocktailName = try? AttributedString(markdown: cocktailName) else {
            return AttributedString(model.name)
        }

        return attributedCocktailName
    }

}


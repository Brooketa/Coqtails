import SwiftUI
import Kingfisher

struct CocktailListItemView: View {

    let highlightText: String
    let thumbnailURL: URL?
    let name: String
    let ingredients: String

    var body: some View {
        HStack(spacing: 30) {
            KFImage(thumbnailURL)
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
                if highlightText.isEmpty {
                    regularCocktailName
                } else {
                    highlightedCoctailName
                }

                Text(ingredients)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(20)
        .contentShape(Rectangle())

        Divider()
            .padding(.horizontal, 20)
    }

    private var regularCocktailName: some View {
        Text(name)
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
        let cocktailNameLower = name.lowercased()
        let textToHighlight = highlightText.lowercased().trimmingCharacters(in: .whitespaces)

        guard
            let range = cocktailNameLower.range(of: textToHighlight),
            highlightText.trimmingCharacters(in: .whitespaces).isEmpty == false
        else { return AttributedString(name) }

        var cocktailName = name
        cocktailName.insert(contentsOf: "**", at: range.upperBound)
        cocktailName.insert(contentsOf: "**", at: range.lowerBound)

        guard let attributedCocktailName = try? AttributedString(markdown: cocktailName) else {
            return AttributedString(name)
        }

        return attributedCocktailName
    }

}


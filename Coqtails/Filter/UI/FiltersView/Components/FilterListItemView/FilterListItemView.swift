import SwiftUI

struct FilterListItemView: View {

    var isSelected: Bool
    var filterName: String

    var body: some View {
        HStack(spacing: 10) {
            Image(isSelected ? "radio_button_selected"  : "radio_button")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)

            Text(filterName)
                .font(.system(size: 15))
                .foregroundStyle(.black)

            Spacer()
        }
        .padding(.init(top: 5, leading: 20, bottom: 8, trailing: 20))
        .contentShape(Rectangle())
    }

}

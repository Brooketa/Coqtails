import SwiftUI

struct DetailsDirectionsView: View {

    let directions: String

    var body: some View {
        VStack {
            Text("Directions:")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text(directions)
                .font(.subheadline)
                .foregroundStyle(.black)
                .lineLimit(nil)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity ,alignment: .leading)
        }
        .padding(.horizontal, 20)
    }

}

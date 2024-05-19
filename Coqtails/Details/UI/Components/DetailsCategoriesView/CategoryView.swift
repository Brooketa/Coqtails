import SwiftUI

struct CategoryView: View {

    let imageName: String
    let title: String

    var body: some View {
        VStack {
            Circle()
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(imageName)
                        .padding(10)
                }

            Text(title)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
    }

}

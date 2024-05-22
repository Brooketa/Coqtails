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
                }

            Text(title)
                .font(.caption)
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity)
    }

}

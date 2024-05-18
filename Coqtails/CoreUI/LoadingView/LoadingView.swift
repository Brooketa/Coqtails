import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack(spacing: 30) {
            Text("Something yummy is on your way!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)

            Image("coctail")
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(Color.primaryAccentColor)
    }

}

#Preview {
    LoadingView()
}

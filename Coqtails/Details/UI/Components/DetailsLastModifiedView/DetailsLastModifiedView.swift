import SwiftUI

struct DetailsLastModifiedView: View {

    let lastModified: Date

    var body: some View {
        HStack {
            Text("Last modified:")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(.black)
                .frame(alignment: .leading)

            Text("\(lastModified.timeAgo())")
                .font(.system(size: 16))
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }

}

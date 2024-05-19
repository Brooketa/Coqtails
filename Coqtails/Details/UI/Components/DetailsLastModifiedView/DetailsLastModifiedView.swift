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

            Text("\(lastModified.description)")
                .font(.system(size: 16))
        }
    }

}

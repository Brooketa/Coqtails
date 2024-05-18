import SwiftUI

struct SearchBarView: View {

    @Binding var searchText: String
    @Binding var shouldBeFocused: Bool

    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            Image("search", bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.leading, .top, .bottom], 7)

            TextField("", text: $searchText)
                .font(.system(size: 15))
                .autocorrectionDisabled()
                .focused($isFocused)
                .tint(.black)
                .overlay(alignment: .leading) {
                    HStack {
                        if searchText.isEmpty && isFocused {
                            Text("Type to search")
                                .font(.system(size: 15))
                                .foregroundStyle(.gray)
                                .allowsHitTesting(false)
                        } else if searchText.isEmpty && !isFocused {
                            Text("Search")
                                .font(.system(size: 15))
                                .foregroundStyle(.black)
                                .allowsHitTesting(false)
                        }
                    }
                }
        }
        .overlay(alignment: .trailing) {
            if !searchText.isEmpty || isFocused {
                TextFieldCancelButton {
                    searchText.removeAll()
                    isFocused = false
                }
                .frame(width: 20, height: 20)
                .padding(.horizontal, 10)
                .transition(.scale)
            }
        }
        .padding(8)
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(.white)
        }
        .onChange(of: isFocused, {
            shouldBeFocused = isFocused
        })
        .onAppear {
            isFocused = shouldBeFocused
        }
    }

}

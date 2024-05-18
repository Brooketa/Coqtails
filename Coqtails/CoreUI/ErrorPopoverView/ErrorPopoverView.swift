import SwiftUI

public struct ErrorPopoverView: View {

  let text: String
  let buttonText: String
  let completed: (() -> Void)?

  public init(text: String, buttonText: String = "Okay", completed: (() -> Void)? = nil) {
    self.text = text
    self.buttonText = buttonText
    self.completed = completed
  }

  public var body: some View {
    VStack(spacing: 20) {
      Text(text)
        .font(.title2)
        .multilineTextAlignment(.center)
        .foregroundStyle(.foreground)

      Button {
        completed?()
      } label: {
        Text(buttonText)
          .padding(.horizontal, 80)
      }
    }
    .padding()
    .padding(.horizontal)
    .background(.white)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .overlay(
      RoundedRectangle(cornerRadius: 20)
        .inset(by: 0.5)
        .stroke(Color(red: 0.33, green: 0.25, blue: 0.5), lineWidth: 1)
    )
  }

}

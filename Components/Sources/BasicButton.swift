import SwiftUI

public struct BasicButton: View {
  public let title: String
  public let action: () -> Void
  
  public init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  public var body: some View {
    Button(action: action) {
      Text(title)
        .font(.headline)
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(8)
    }
  }
}

#Preview {
  BasicButton(title: "Sample Button") {
    print("Button tapped")
  }
}
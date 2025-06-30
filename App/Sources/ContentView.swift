import SwiftUI
import Core

public struct ContentView: View {
  public init() {}

  public var body: some View {
    VStack {
      Text(Core().hello())
        .padding()

      Text("\(Core().random())")
        .padding()
    }
  }
}

#Preview {
  ContentView()
}

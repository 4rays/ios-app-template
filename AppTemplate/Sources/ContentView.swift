import SwiftUI
import ModuleTemplate

public struct ContentView: View {
  public init() {}

  public var body: some View {
    VStack {
      Text(ModuleTemplate().hello())
        .padding()

      Text("\(ModuleTemplate().random())")
        .padding()
    }
  }
}

#Preview {
  ContentView()
}

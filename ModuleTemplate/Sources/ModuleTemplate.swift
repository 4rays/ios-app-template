import Foundation

public struct ModuleTemplate {
  public init() {}

  public func hello() -> String {
    return "Hello, World!"
  }

  public func random() -> Int {
    return Int.random(in: 0...100)
  }
}

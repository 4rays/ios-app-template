import Foundation
import Testing

@Suite struct ComponentsTests {
  @Test func testTwoPlusTwoIsFour() {
    #expect(2 + 2 == 4)
  }
}
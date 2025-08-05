import Foundation
import Testing

@Suite struct IndigoTests {
  @Test func testTwoPlusTwoIsFour() {
    #expect(2 + 2 == 4)
  }
}
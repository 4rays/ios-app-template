import Foundation
import Testing

@Suite struct AppTests {
  @Test func testTwoPlusTwoIsFour() {
    #expect(2 + 2 == 4)
  }
}

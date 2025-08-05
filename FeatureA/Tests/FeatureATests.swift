import ComposableArchitecture
import Testing

@testable import FeatureA

@MainActor
struct FeatureATests {
  @Test
  func increment() async {
    let store = TestStore(initialState: FeatureA.State(count: 0)) {
      FeatureA()
    }

    await store.send(.incrementButtonTapped) {
      $0.count = 1
    }

    await store.send(.incrementButtonTapped) {
      $0.count = 2
    }
  }

  @Test
  func decrement() async {
    let store = TestStore(initialState: FeatureA.State(count: 5)) {
      FeatureA()
    }

    await store.send(.decrementButtonTapped) {
      $0.count = 4
    }

    await store.send(.decrementButtonTapped) {
      $0.count = 3
    }
  }

  @Test
  func reset() async {
    let store = TestStore(initialState: FeatureA.State(count: 42)) {
      FeatureA()
    }

    await store.send(.resetButtonTapped) {
      $0.count = 0
    }
  }

  @Test
  func incrementDecrementSequence() async {
    let store = TestStore(initialState: FeatureA.State()) {
      FeatureA()
    }

    // Start at 0, increment to 2, then decrement back to 0
    await store.send(.incrementButtonTapped) {
      $0.count = 1
    }

    await store.send(.incrementButtonTapped) {
      $0.count = 2
    }

    await store.send(.decrementButtonTapped) {
      $0.count = 1
    }

    await store.send(.decrementButtonTapped) {
      $0.count = 0
    }
  }
}

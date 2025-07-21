import ComposableArchitecture
import SwiftUI

@Reducer
public struct FeatureA {
  @ObservableState
  public struct State: Equatable {
    public var count = 0
    public var isLoading = false

    public init(count: Int = 0) {
      self.count = count
    }
  }

  public enum Action {
    case incrementButtonTapped
    case decrementButtonTapped
    case resetButtonTapped
  }

  public init() {}

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .incrementButtonTapped:
        state.count += 1
        return .none

      case .decrementButtonTapped:
        state.count -= 1
        return .none

      case .resetButtonTapped:
        state.count = 0
        return .none
      }
    }
  }
}

// MARK: - SwiftUI View

public struct FeatureAView: View {
  @Bindable public var store: StoreOf<FeatureA>

  public init(store: StoreOf<FeatureA>) {
    self.store = store
  }

  public var body: some View {
    VStack(spacing: 20) {
      Text("\(store.count)")
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.primary)

      HStack(spacing: 16) {
        Button("-") {
          store.send(.decrementButtonTapped)
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .frame(width: 50, height: 50)

        Button("+") {
          store.send(.incrementButtonTapped)
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
        .frame(width: 50, height: 50)
      }

      Button("Reset") {
        store.send(.resetButtonTapped)
      }
      .buttonStyle(.bordered)
    }
    .padding()
  }
}

// MARK: - Preview

#Preview {
  FeatureAView(
    store: Store(initialState: FeatureA.State()) {
      FeatureA()
    }
  )
}

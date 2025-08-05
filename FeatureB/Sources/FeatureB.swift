import ComposableArchitecture
import SwiftUI

@Reducer
public struct FeatureB {
  @ObservableState
  public struct State: Equatable {
    public var todos: [Todo] = []
    public var newTodoText = ""
    public var isLoading = false

    public init(todos: [Todo] = []) {
      self.todos = todos
    }
  }

  public enum Action {
    case addTodoButtonTapped
    case deleteTodo(id: Int)
    case toggleTodo(id: Int)
    case newTodoTextChanged(String)
  }

  public init() {}

  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addTodoButtonTapped:
        guard !state.newTodoText.isEmpty else { return .none }
        let newTodo = Todo(text: state.newTodoText)
        state.todos.append(newTodo)
        state.newTodoText = ""
        return .none

      case let .deleteTodo(id):
        state.todos.removeAll { $0.id == id }
        return .none

      case let .toggleTodo(id):
        if let index = state.todos.firstIndex(where: { $0.id == id }) {
          state.todos[index].isCompleted.toggle()
        }
        return .none

      case let .newTodoTextChanged(text):
        state.newTodoText = text
        return .none
      }
    }
  }
}

public struct Todo: Equatable, Identifiable {
  public let id: Int
  public var text: String
  public var isCompleted = false

  public init(id: Int = 0, text: String) {
    self.text = text
    self.id = id
  }
}

// MARK: - SwiftUI View

public struct FeatureBView: View {
  @Bindable public var store: StoreOf<FeatureB>

  public init(store: StoreOf<FeatureB>) {
    self.store = store
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Todo List")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding(.bottom)

      HStack {
        TextField("Enter new todo", text: $store.newTodoText.sending(\.newTodoTextChanged))
          .textFieldStyle(.roundedBorder)

        Button("Add") {
          store.send(.addTodoButtonTapped)
        }
        .buttonStyle(.borderedProminent)
        .disabled(store.newTodoText.isEmpty)
      }

      List {
        ForEach(store.todos) { todo in
          HStack {
            Button(action: {
              store.send(.toggleTodo(id: todo.id))
            }) {
              Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(todo.isCompleted ? .green : .secondary)
            }
            .buttonStyle(.plain)

            Text(todo.text)
              .strikethrough(todo.isCompleted)
              .foregroundColor(todo.isCompleted ? .secondary : .primary)

            Spacer()
          }
          .swipeActions(edge: .trailing) {
            Button("Delete", role: .destructive) {
              store.send(.deleteTodo(id: todo.id))
            }
          }
        }
      }
      .listStyle(.plain)

      Spacer()
    }
    .padding()
  }
}

// MARK: - Preview

#Preview {
  FeatureBView(
    store: Store(
      initialState: FeatureB.State(todos: [
        Todo(text: "Sample todo item"),
        Todo(text: "Another todo"),
      ])
    ) {
      FeatureB()
    }
  )
}

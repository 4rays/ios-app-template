import ComposableArchitecture
import Testing

@testable import FeatureB

@MainActor
struct FeatureBTests {
  @Test
  func addTodo() async {
    let store = TestStore(initialState: FeatureB.State()) {
      FeatureB()
    }

    await store.send(.newTodoTextChanged("Buy groceries")) {
      $0.newTodoText = "Buy groceries"
    }

    await store.send(.addTodoButtonTapped) {
      $0.todos = [Todo(text: "Buy groceries")]
      $0.newTodoText = ""
    }
  }

  @Test
  func deleteTodo() async {
    let initialTodo = Todo(text: "Test todo")
    let store = TestStore(initialState: FeatureB.State(todos: [initialTodo])) {
      FeatureB()
    }

    await store.send(.deleteTodo(id: initialTodo.id)) {
      $0.todos = []
    }
  }

  @Test
  func toggleTodo() async {
    let initialTodo = Todo(text: "Complete task")
    let store = TestStore(initialState: FeatureB.State(todos: [initialTodo])) {
      FeatureB()
    }

    await store.send(.toggleTodo(id: initialTodo.id)) {
      $0.todos[0].isCompleted = true
    }

    await store.send(.toggleTodo(id: initialTodo.id)) {
      $0.todos[0].isCompleted = false
    }
  }

  @Test
  func addMultipleTodos() async {
    let store = TestStore(initialState: FeatureB.State()) {
      FeatureB()
    }

    await store.send(.newTodoTextChanged("First task")) {
      $0.newTodoText = "First task"
    }

    await store.send(.addTodoButtonTapped) {
      $0.todos = [Todo(text: "First task")]
      $0.newTodoText = ""
    }

    await store.send(.newTodoTextChanged("Second task")) {
      $0.newTodoText = "Second task"
    }

    await store.send(.addTodoButtonTapped) {
      $0.todos = [
        Todo(text: "First task"),
        Todo(text: "Second task"),
      ]
      $0.newTodoText = ""
    }
  }
}

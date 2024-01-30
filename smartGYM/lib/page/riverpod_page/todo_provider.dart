import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 할 일을 나타내는 클래스
class Todo {
  final String title;

  Todo({
    required this.title,
  });
}

// 데이터 로딩 상태를 표현하는 열거형
enum LoadingState {
  loading,
  loaded,
  error,
}

// 할 일 목록의 상태를 나타내는 클래스
@immutable
class TodoListState {
  final List<Todo> todos; // 할 일 목록
  final LoadingState loadingState; // 데이터 로딩 상태

  const TodoListState({
    required this.todos,
    required this.loadingState,
  });

  // 상태를 복사하여 일부 속성만 변경하는 메서드
  TodoListState copyWith({
    List<Todo>? todos,
    LoadingState? loadingState,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}

// 할 일 목록의 상태를 업데이트하는 클래스
class TodoListNotifier extends StateNotifier<TodoListState> {
  // 초기 상태를 설정
  TodoListNotifier() : super(const TodoListState(todos: [], loadingState: LoadingState.loading));

  // 할 일 목록을 불러오는 비동기 메서드
  void loadTodos() {
    // 비동기 작업을 수행하고 데이터를 가져오는 로직을 추가할 수 있습니다.
    // 예시로 간단히 2초 후에 더미 데이터를 업데이트하는 방식을 사용합니다.
    Future.delayed(const Duration(seconds: 2), () {
      final loadedTodos = [
        Todo(title: 'Task 1'),
        Todo(title: 'Task 2'),
        Todo(title: 'Task 3'),
      ];

      // 상태를 업데이트하여 불러온 할 일 목록으로 설정
      state = state.copyWith(todos: loadedTodos, loadingState: LoadingState.loaded);
    });
  }

  // 할 일을 추가하는 메서드
  void addTodo(String title) {
    // 새로운 할 일을 추가하는 로직
    final newTodo = Todo(title: title);
    final updatedTodos = List<Todo>.from(state.todos)..add(newTodo);
    state = state.copyWith(todos: updatedTodos);
  }

  // 할 일을 제거하는 메서드
  void removeTodo(int index) {
    // 할 일을 제거하는 로직
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(index);
    state = state.copyWith(todos: updatedTodos);
  }
}

// StateNotifierProvider를 사용하여 TodoListNotifier를 제공하는 Provider
final todoListProvider = StateNotifierProvider<TodoListNotifier, TodoListState>(
      (ref) => TodoListNotifier(),
);

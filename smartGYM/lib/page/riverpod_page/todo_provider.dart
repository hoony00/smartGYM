// todo_provider.dart

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

@immutable
class TodoListState {
  final List<Todo> todos;
  final LoadingState loadingState;

  const TodoListState({
    required this.todos,
    required this.loadingState,
  });

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

class TodoListNotifier extends StateNotifier<TodoListState> {
  TodoListNotifier()
      : super(
            const TodoListState(todos: [], loadingState: LoadingState.loading));

  void loadTodos() {
    Future.delayed(const Duration(seconds: 2), () {
      final loadedTodos = [
        Todo(title: 'Task 1'),
        Todo(title: 'Task 2'),
        Todo(title: 'Task 3'),
      ];

      state =
          state.copyWith(todos: loadedTodos, loadingState: LoadingState.loaded);
    });
  }

  void addTodo(String title) {
    final newTodo = Todo(title: title);
    final updatedTodos = List<Todo>.from(state.todos)..add(newTodo);
    state = state.copyWith(todos: updatedTodos);
  }

  void removeTodo(int index) {
    final updatedTodos = List<Todo>.from(state.todos)..removeAt(index);
    state = state.copyWith(todos: updatedTodos);
  }
}

final todoListProvider = StateNotifierProvider<TodoListNotifier, TodoListState>(
  (ref) => TodoListNotifier(),
);

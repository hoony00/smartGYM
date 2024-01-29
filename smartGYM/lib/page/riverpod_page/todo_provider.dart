
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateProvider((ref) => TodoModel(todos: []));

class Todo {
  final String title;
  Todo({
    required this.title,
  });
}

class TodoModel{

  TodoModel copyWith({
    required Todo newTodo,
  }) {
    return TodoModel(todos: [...todos, newTodo]);
  }

  List<Todo> todos = [];


  TodoModel({required this.todos});

  int get count => todos.length;

  void add(String title) {
    final todo = Todo(
      title: title,
    );

    todos.add(todo);
  }

  void remove(String title) {
    todos.removeWhere((todo) => todo.title == title);
  }
}
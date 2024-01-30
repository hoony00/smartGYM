import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  final String title;

  const Todo({required this.title});
}

class TodoState {
  final List<Todo> todoList;

  const TodoState({required this.todoList});
}

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(const TodoState(todoList: []));


 void add(String title) {
   state = TodoState(todoList: [
     ...state.todoList, Todo(
       title: title), Todo(
         title: "${title}2"),
   ]);
 }

}

final todoProvider = StateNotifierProvider<TodoNotifier, TodoState>((ref)
  => TodoNotifier(),
);

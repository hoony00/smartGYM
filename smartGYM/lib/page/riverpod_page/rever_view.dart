import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/todo_provider.dart';
import 'package:gym_app/widget/w_line.dart';

import '../single_provider.dart';

class RiverView extends ConsumerWidget {
  const RiverView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // todoListProvider를 통해 TodoListNotifier를 가져옴
    final TodoListState todoListState = ref.watch(todoListProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('할 일 목록'),
            const Line(),
            // 할 일 목록 출력
            ...todoListState.todos.map((todo) => Text(todo.title)),
            ElevatedButton(
              onPressed: () {
                // 할 일 추가 버튼 클릭 시 TodoListProvider의 addTodo 메서드 호출
                ref.read(todoListProvider.notifier).addTodo("New Task");
              },
              child: const Text('할일 추가'),
            ),
            ElevatedButton(
              onPressed: () {
                // 할 일 제거 버튼 클릭 시 TodoListProvider의 removeTodo 메서드 호출
                if (todoListState.todos.isNotEmpty) {
                  ref.read(todoListProvider.notifier).removeTodo(0);
                }
              },
              child: const Text('할일 제거'),
            ),
          ],
        ),
      ),
    );
  }
}

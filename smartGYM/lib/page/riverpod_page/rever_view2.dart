import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/todo_provider.dart';
import 'package:gym_app/widget/w_line.dart';

class RiverView2 extends ConsumerWidget {
  const RiverView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final todoList = ref.watch(todoProvider);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('할 일 목록'),
            const Line(),
            ...todoList.todoList.map((e) => Text(e.title)).toList(),

            Column(
              children: [
                // 할 일 목록 출력
                ElevatedButton(
                  onPressed: () {
                    ref.read(todoProvider.notifier).add('할일 추가');
                  },
                  child: const Text('할일 추가'),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text('할일 제거'),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

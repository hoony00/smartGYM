import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/todo_provider.dart';
import 'package:gym_app/widget/w_line.dart';

import '../single_provider.dart';

class RiverView extends ConsumerWidget {
  const RiverView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    // final String testValue = ref.watch(testIntegerProvider) as String;

    ref.listen(counterProvider, (previousState, newState) {
      print("The new value is $newState");
    });

    final state = ref.watch(todoProvider);
    print("state.count : ${state.count}");

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            if (state.todos != null)
              ...List.generate(
                state.count,
                    (index) => Text(state.todos![index].title),
              ).toList(),

            ElevatedButton(onPressed: () {
              ref
                  .read(todoProvider.notifier)
                  .update((state) => state.copyWith(newTodo: Todo(title: 'test')));


                  }, child: const Text('할일 추가')),
            ElevatedButton(onPressed: () {
              state.remove("test");
            }, child: const Text('할일 제거')),
          ],
        ),
      ),

    );
  }

}

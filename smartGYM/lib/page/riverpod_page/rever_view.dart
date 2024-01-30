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

    ref.listen(counterProvider, (previousState, newState) {
      print("The new value is $newState");
    });



    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {


                  }, child: const Text('할일 추가')),
            ElevatedButton(onPressed: () {

            }, child: const Text('할일 제거')),
          ],
        ),
      ),

    );
  }

}

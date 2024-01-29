import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text(' counter -> up'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrease();
              },
              child: const Text(' counter -> down'),
            ),
            ElevatedButton(
              onPressed: () {},
              // child:  Text(ref.watch(counterProvider).toString()),
              child: Text(ref.watch(counterProvider).toString()),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(testIntegerProvider.notifier).state += 100;
              },
              child: const Text(' testInterger -> up'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.watch(testIntegerProvider.notifier).state = 0;
              },
              // child:  Text(ref.watch(counterProvider).toString()),
              child: Text(ref.watch(testIntegerProvider).toString()),
            ),

            ElevatedButton(
              onPressed: () {
                ref.invalidate(counterProvider);
              },
              child:  Text("invalidate"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.refresh(counterProvider);
              },
              child:  Text("refresh"),
            ),
          ],
        ),
      ),
    );
  }
}

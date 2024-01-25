import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../single_provider.dart';

class RiverView extends ConsumerWidget {
  const RiverView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    ref.listen(counterProvider, (previousState, newState) {
      print("The new value is $newState");
    });

    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text('up'),
            ),
            ElevatedButton(
              onPressed: () {

              },
             // child:  Text(ref.watch(counterProvider).toString()),
              child:  Text(ref.watch(counterProvider).toString()),
            ),
          ],
        ),
      ),
    );
  }
}

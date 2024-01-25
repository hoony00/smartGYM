import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../single_provider.dart';

class RiverView extends ConsumerWidget {
  const RiverView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Hello world'),
            ElevatedButton(
              onPressed: () {
                ref.refresh(helloWorldProvider);
              },
              child: const Text('새로고침'),
            ),
            ElevatedButton(
              onPressed: () {

              },
              child: const Text('수정'),
            ),
          ],
        ),
      ),
    );
  }
}

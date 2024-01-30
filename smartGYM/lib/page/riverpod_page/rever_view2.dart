import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/stateProvider/state.dart';

class TestStateProvider extends ConsumerWidget {
  const TestStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(ref.watch(userNameProvider)),
            ElevatedButton(
              onPressed: () {
                ref.read(userNameProvider.notifier).state = 'hoony2';
              },
              child: const Text('이름 변경'),
            ),
          ],
        ),
      ),
    );
  }
}

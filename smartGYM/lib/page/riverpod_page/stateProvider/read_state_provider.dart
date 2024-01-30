import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/stateProvider/state.dart';

class ReadStateProvider extends ConsumerWidget {
  const ReadStateProvider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              ref.watch(userNameProvider),
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(userNameProvider.notifier).state = '도라에몽';
              },
              child: const Text('도라에몽으로 이름 변경'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(userNameProvider);
              },
              child: const Text('초기값으로 변경'),
            ),
          ],
        ),
      ),
    );
  }
}

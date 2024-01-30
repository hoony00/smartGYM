import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/stateProviders/states.dart';

class ReadStateProviders extends ConsumerWidget {
  const ReadStateProviders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 이 부분 변경
    final myObject = ref.watch(myObjectProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProviders'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              myObject.stringValue,
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              myObject.intValue.toString(),
              style: const TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
               /* ref.read(myObjectProvider.notifier).state =
                    myObject.copyWith(stringValue: '호호호',
                    intValue: 100);*/
                ref.read(myObjectProvider.notifier).updateMyObject(
                      intValue: 100,
                      stringValue: '호호호',
                    );
              },
              child: const Text('copyWith 변경 실행'),
            ),
            ElevatedButton(
              onPressed: () {
              /*  ref.read(myObjectProvider.notifier).state = myObject.copyWith(
                  stringValue: '스트링값만',
                );*/
                ref.read(myObjectProvider.notifier).updateMyObject(
                      stringValue: '호호호',
                    );
              },
              child: const Text('copyWith 스트링만 변경 실행'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.refresh(myObjectProvider);
              },
              child: const Text('초기값으로 변경'),
            ),
          ],
        ),
      ),
    );
  }
}

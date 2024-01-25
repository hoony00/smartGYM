import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => "Hello world");


final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(ref);
});

class Counter extends StateNotifier<int> {
  Counter(this.ref) : super(0);

  final Ref ref;

  void increment() {
    // Counter 클래스는 다른 프로바이더를 읽기 위해 "ref"를 사용할 수 있습니다.
    state ++;
  }
}
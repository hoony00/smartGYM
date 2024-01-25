import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => "Hello RiverPod");


final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter(ref);
});


@immutable
class CounterState {

  int count = 0;


  void copyWith(int? count) {
    this.count = count ?? this.count;
  }

}

class Counter extends StateNotifier<int> {
  Counter(this.ref) : super(0);

  final Ref ref;
  final String name = "SangHoon";

  void increment() {
    // Counter 클래스는 다른 프로바이더를 읽기 위해 "ref"를 사용할 수 있습니다.
    state ++;
  }
}
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyObject {
  final String stringValue;
  final int intValue;

  MyObject({required this.stringValue, required this.intValue});

  // copyWith 메서드 추가
  MyObject copyWith({String? stringValue, int? intValue}) {
    return MyObject(
      stringValue: stringValue ?? this.stringValue,
      intValue: intValue ?? this.intValue,
    );
  }
}

class MyObjectNotifier extends StateNotifier<MyObject> {
  MyObjectNotifier(MyObject value) : super(value);

  // MyObject의 일부 필드를 업데이트하는 메서드
  void updateMyObject({String? stringValue, int? intValue}) {
    state = state.copyWith(
      stringValue: stringValue,
      intValue: intValue,
    );
  }
}

final myObjectProvider =
StateNotifierProvider<MyObjectNotifier, MyObject>((ref) {
  return MyObjectNotifier(MyObject(stringValue: '초기값', intValue: 0));
});


// stateProvider
/*final myObjectProvider = StateProvider<MyObject>((ref) {
  return MyObject(stringValue: '초기값', intValue: 0);
});*/


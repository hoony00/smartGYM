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

final myObjectProvider = StateProvider<MyObject>((ref) {
  return MyObject(stringValue: '초기값', intValue: 0);
});


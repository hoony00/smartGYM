// gym_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../common/utill/json_converter_util.dart';


@JsonSerializable()
class GymMachineItem {
  final String id;
  final String name;
  final int totalSlots;
  List<int> reservedSlots;  // 각 시간에 예약된 슬롯 수를 나타내는 리스트
  @TimestampConverter()
  final DateTime createdAt;
/*  @JsonKey(
    fromJson: firestoreDocRefFromJson,
    includeFromJson: true,
    includeToJson: false,
  )
  DocumentReference? reference;*/

  GymMachineItem({
    required this.id,
    required this.name,
    required this.totalSlots,
    required this.reservedSlots,
    required this.createdAt,
  });




}

List<GymMachineItem> machines = [
  GymMachineItem(
    id: '1',
    name: '밴치 프레스',
    totalSlots: 5, // 18시간 * 5명
    reservedSlots: List<int>.filled(5, 0), // 각 시간별로 초기화
    createdAt: DateTime.now(),

  ),
  GymMachineItem(
    id: '2',
    name: '렛풀 다운',
    totalSlots: 5, // 18시간 * 5명
    reservedSlots: List<int>.filled(18, 0), // 각 시간별로 초기화
    createdAt: DateTime.now(),

  ),
  GymMachineItem(
    id: '3',
    name: '스쿼트 머신',
    totalSlots: 5, // 18시간 * 5명
    reservedSlots: List<int>.filled(18, 0), // 각 시간별로 초기화
    createdAt: DateTime.now(),

  ),
  GymMachineItem(
    id: '4',
    name: '레그 익스텐션',
    totalSlots: 5, // 18시간 * 5명
    reservedSlots: List<int>.filled(18, 0), // 각 시간별로 초기화
    createdAt: DateTime.now(),

  ),

  // Add more machines as needed
];

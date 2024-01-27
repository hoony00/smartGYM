// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GymMachineItem _$GymMachineItemFromJson(Map<String, dynamic> json) =>
    GymMachineItem(
      id: json['id'] as String,
      name: json['name'] as String,
      totalSlots: json['totalSlots'] as int,
      reservedSlots: (json['reservedSlots'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$GymMachineItemToJson(GymMachineItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'totalSlots': instance.totalSlots,
      'reservedSlots': instance.reservedSlots,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

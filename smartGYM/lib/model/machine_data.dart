// gym_model.dart

class GymMachineItem {
  final String id;
  final String name;
  final int totalSlots;
  List<int> reservedSlots;  // 각 시간에 예약된 슬롯 수를 나타내는 리스트

  GymMachineItem({
    required this.id,
    required this.name,
    required this.totalSlots,
    required this.reservedSlots,
  });
}

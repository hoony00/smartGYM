import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../provider/machine/machine_provider.dart';
import '../../../../provider/auth/auth_provider.dart';

class TimeSlotTile extends ConsumerStatefulWidget {
  final int timeIndex;
  final String machineName;
  const TimeSlotTile({super.key, required this.timeIndex, required this.machineName});

  @override
  ConsumerState<TimeSlotTile> createState() => _TimeSlotTileState();
}

class _TimeSlotTileState extends ConsumerState<TimeSlotTile> {
  @override
  Widget build(BuildContext context) {
    final timeIndex = widget.timeIndex;
    final machineName = widget.machineName;

    final startTime = _calculateStartTime(widget.timeIndex);
    final machineState = ref.watch(machineListProvider.notifier).getMachineByName(machineName);

    return ListTile(
      title: Row(
        children: [
          Text(startTime),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: machineState.isReservations[timeIndex] ? null : () =>
            _handleReservation(timeIndex, machineName),
        // Adjust for 0-based index
        child: Text(machineState.isReservations[timeIndex] ? '예약 불가' : '예약하기'),
      ),
    );
  }

  String _calculateStartTime(int timeIndex) {

    final timeOfHours = DateTime.now().hour;

    // 하드코딩된 종료 시간을 반환합니다.
    switch (timeIndex) {
      case 0:
        return '$timeOfHours:00 - ${timeOfHours}:10';
      case 1:
        return '$timeOfHours:20 - ${timeOfHours}:30';
      case 2:
        return '$timeOfHours:40 - ${timeOfHours}:50';
      default:
        {
          throw Exception('Invalid time index');
        }
    }
  }

  void _handleReservation(int timeIndex, String machineName) {


    // 정말 예약할건지 묻는 다이얼로그
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('예약 확인'),
          content: const Text('정말 예약하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                final authState = ref.read(authProvider);
                ref.read(machineListProvider.notifier).changeReservation(
                    machineName, timeIndex, authState);
                Navigator.of(context).pop();
                //Ui 새로고침
              },
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  }
}

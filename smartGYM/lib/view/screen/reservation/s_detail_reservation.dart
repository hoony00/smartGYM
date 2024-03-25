
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/m_machine.dart';

import '../../../provider/machine/machine_provider.dart';

class DetailMachineReservationScreen extends ConsumerStatefulWidget {
  const DetailMachineReservationScreen({super.key, required this.machineName});

  final String machineName;

  @override
  ConsumerState<DetailMachineReservationScreen> createState() =>
      _DetailMachineReservationState();
}

class _DetailMachineReservationState
    extends ConsumerState<DetailMachineReservationScreen> {
  @override
  Widget build(BuildContext context) {
    final MachineModel machine = ref
        .read(machineListProvider.notifier)
        .getMachineByName(widget.machineName);

    return Scaffold(
      appBar: AppBar(
        title: Text(machine.machineName),
      ),
      body: SingleChildScrollView( // SingleChildScrollView 추가
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image and description section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: machine.machineImageUrl,
                    child: Image.asset(
                      machine.machineImageUrl,
                      fit: BoxFit.contain,
                      height: 250.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(machine.machineDescription,
                      style: const TextStyle(fontSize: 16.0)),
                ],
              ),
            ),

            // Time slots and reservation buttons as a fixed list
            Column(
              children: [
                _buildTimeSlotTile(1, machine.isReservations[0]),
                _buildTimeSlotTile(2, machine.isReservations[1]),
                _buildTimeSlotTile(3, machine.isReservations[2]),
              ],
            ),

            // 바텀 오벌뷰 추가
            BottomAppBar(
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 기울어진 글씨
                  Text(
                    '#${machine.machineType} ',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlotTile(int timeIndex, bool isReserved) {
    return ListTile(
      title: Text('시간 $timeIndex'),
      trailing: ElevatedButton(
        onPressed: isReserved ? null : () => _handleReservation(timeIndex - 1),
        // Adjust for 0-based index
        child: Text(isReserved ? '예약 불가' : '예약하기'),
      ),
    );
  }

  void _handleReservation(int timeIndex) {
    print('$timeIndex');
    // Implement reservation logic here
  }
}
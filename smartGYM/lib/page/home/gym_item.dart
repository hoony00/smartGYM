import 'package:flutter/material.dart';

import '../../model/machine_data.dart';

class GymMachineListItem extends StatelessWidget {
  final GymMachineItem machine;

  GymMachineListItem({required this.machine});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
        elevation: 3,
        // 그림자의 깊이를 조절하는 elevation 값
        margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0),
    ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              machine.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total slots: ${machine.totalSlots}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Reserved slots: ${machine.reservedSlots}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
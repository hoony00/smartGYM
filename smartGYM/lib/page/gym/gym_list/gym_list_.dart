import 'package:flutter/material.dart';

import '../../../model/machine_data.dart';
import 'gym_item.dart';

class GymMachineList extends StatelessWidget {
  final List<GymMachineItem> machines;

  GymMachineList({required this.machines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: machines.length,
      itemBuilder: (context, index) {
        final machine = machines[index];
        return GymMachineListItem(machine: machine);
      },
    );
  }
}
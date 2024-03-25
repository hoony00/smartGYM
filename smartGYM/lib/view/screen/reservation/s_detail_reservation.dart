import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/m_machine.dart';

import '../../../provider/machine/machine_provider.dart';

class DetailMachineReservationScreen extends ConsumerStatefulWidget {
  const DetailMachineReservationScreen({super.key, required this.machineName});
  final String machineName;

  @override
  ConsumerState<DetailMachineReservationScreen> createState() => _DetailMachineReservationState();
}

class _DetailMachineReservationState extends ConsumerState<DetailMachineReservationScreen> {
  @override
  Widget build(BuildContext context) {

    final MachineModel machine = ref.read(machineListProvider.notifier).getMachineByName(widget.machineName);


    return Scaffold(
      appBar: AppBar(
        title: Text(machine.machineName),
      ),
      body: Column(
        children: [
          Text(machine.machineDescription),
        ],
      ),
    );
  }
}

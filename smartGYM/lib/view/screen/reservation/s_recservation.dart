import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/machine_images.dart';

import '../../../provider/machine/machine_provider.dart';

class ReservationScreen extends ConsumerStatefulWidget {
  const ReservationScreen({super.key});

  @override
  ConsumerState<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends ConsumerState<ReservationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<MachineModel> machineList = ref.watch(machineListProvider);

    return Scaffold(
      //machineList에 있는 데이터를 화면에 표시해야함
      body: ListView.builder(
        itemCount: machineList.length,
        itemBuilder: (context, index) {
          final machine = machineList[index];

          return Card(
            child: Column(
              children: [
                Image.asset('assets/images/machine/${machine.machineImageUrl}.png'),
                Text(machine.machineName),
                Text(machine.machineDescription),
                Text(machine.isReservations.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}

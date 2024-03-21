import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/model/machine_images.dart';

import '../../../provider/images/images_provider.dart';

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


    print("machineList: $machineList");


    return Scaffold(
      //machineList에 있는 데이터를 화면에 표시해야함
      body: ListView.builder(
        itemCount: machineList.length,
        itemBuilder: (context, index) {
          final machine = machineList[index];
          return Text(machine.machineName, style: const TextStyle(fontSize: 20, color: Colors.white));
        },
      ),
    );
  }
}

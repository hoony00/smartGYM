import 'package:flutter/material.dart';

import '../../model/machine_data.dart';
import 'gym_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GymMachineItem> machines = [
    GymMachineItem(
      id: '1',
      name: '밴치 프레스',
      totalSlots: 18 * 5,  // 18시간 * 5명
      reservedSlots: List<int>.filled(18, 0),  // 각 시간별로 초기화
    ),
    GymMachineItem(
      id: '2',
      name: '렛풀 다운',
      totalSlots: 18 * 5,  // 18시간 * 5명
      reservedSlots: List<int>.filled(18, 0),  // 각 시간별로 초기화
    ),
    // Add more machines as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym App'),
      ),
      body: GymMachineList(machines: machines),
    );
  }
}

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



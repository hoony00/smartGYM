import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../model/machine_data.dart';
import 'gym_item.dart';
import 'package:in_app_review/in_app_review.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
/*  List<GymMachineItem> machines = [
    GymMachineItem(
      id: '1',
      name: '밴치 프레스',
      totalSlots: 18 * 5, // 18시간 * 5명
      reservedSlots: List<int>.filled(18, 0), // 각 시간별로 초기화
    ),
    GymMachineItem(
      id: '2',
      name: '렛풀 다운',
      totalSlots: 18 * 5, // 18시간 * 5명
      reservedSlots: List<int>.filled(18, 0), // 각 시간별로 초기화
    ),
    // Add more machines as needed
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gym App'),
      ),
      body: Column(
        children: [
          // go로 이동시 replace
          // push로 이동시 스택 추가
          ElevatedButton(
              onPressed: () => context.push('/test'),
              child: const Text('test 페이지 이동')),
          ElevatedButton(
              onPressed: () =>
                  context.go('/tesdsw2t/testson', extra: {"test": "넘기는 값입니다."}),
              child: const Text('testson 페이지 이동')),
          // Expanded(child: GymMachineList(machines: machines)),

          ElevatedButton(
            onPressed: () {},
            child:  Text('사이즈 측정', style: TextStyle(fontSize: 50.sp),),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
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

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
      body: ListView.builder(
        itemCount: machineList.length,
        itemBuilder: (context, index) {
          final machine = machineList[index];

          return Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Image with appropriate sizing
                    Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAlias, // Prevent image overflow
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/images/machine/${machine.machineImageUrl}.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align text to left
                        children: [
                          Text(
                            machine.machineName,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            machine.machineDescription,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              /// todo : 예약 상태, 예약 버튼 추가하기
            ),
          );
        },
      ),
    );
  }
}

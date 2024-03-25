import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/common/colors/color_palette.dart';
import 'package:gym_app/model/m_machine.dart';
import 'package:gym_app/widget/w_appBar.dart';

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
      body: Column(
        children: [
          CustomAppbar(title: '예약하기'),
          _ReservationList(machineList: machineList),
        ],
      ),
    );
  }
}

class _ReservationList extends StatelessWidget {
  const _ReservationList({
    super.key,
    required this.machineList,
  });

  final List<MachineModel> machineList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: machineList.length,
        itemBuilder: (context, index) {

          final isAvailable = isAllAvailable(machineList[index].isReservations);

          final machine = machineList[index];

          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Card(
              margin: const EdgeInsets.all(1),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Image with appropriate sizing
                      Container(
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAlias,
                        // Prevent image overflow
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Align text to left
                          children: [
                            Text(
                              machine.machineName,
                              style: const TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              machine.machineDescription,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Divider(
                              color: ColorPalette.secondColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('#${machine.machineType}',
                                    style: const TextStyle(fontSize: 15.0)),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    backgroundColor: ColorPalette.primaryColor.withOpacity(0.5),
                                    foregroundColor: Colors.white,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                  ),
                                  onPressed: isAvailable ? null : () {
                                    context.push('/reservation/detail/${machine.machineName}');


                                  }, // 예약 가능 여부에 따라 onPressed 설정
                                  child: Text(
                                    isAvailable ? '예약 불가' : '시간 선택',
                                    style: const TextStyle(
                                      color: ColorPalette.white,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],

                /// todo : 예약 상태, 예약 버튼 추가하기
              ),
            ),
          );
        },
      ),
    );
  }

  bool isAllAvailable(List<bool> reservation) {
    for (bool isReserved in reservation) {
      if (!isReserved) {
        return false;
      }
    }
    return true;
  }
}

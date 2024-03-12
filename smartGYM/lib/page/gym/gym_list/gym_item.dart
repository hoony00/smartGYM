import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../model/machine_data.dart';

class GymMachineListItem extends StatefulWidget {
  final GymMachineItem machine;

  const GymMachineListItem({super.key, required this.machine});

  @override
  _GymMachineListItemState createState() => _GymMachineListItemState();
}

class _GymMachineListItemState extends State<GymMachineListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 3,
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
              widget.machine.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              '남은 예약 : ${widget.machine.totalSlots}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? '예약 가능 시간 닫기 >' : '예약 가능 시간 펼치기 >',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            20.heightBox,
            20.heightBox,

            // 예약 가능 시간 펼치기
            if (isExpanded) ...buildTimeSlots(widget.machine),
          ],
        ),
      ),
    );
  }

  List<Widget> buildTimeSlots(GymMachineItem machine) {
    print("widget.machine.reservedSlots.length : ${machine.reservedSlots.length}");
    // 예약 가능 시간에 대한 리스트 생성
    List<Widget> timeSlots = [];
    for (int i = 0; i < machine.reservedSlots.length; i++) {
      timeSlots.add(
        ListTile(
          title: Text('예약 가능 시간 $i'),
          // 여기에 예약 가능 시간을 눌렀을 때의 동작 추가
          onTap: () {
            print('예약 가능 시간 $i 클릭됨');
          },
        ),
      );
    }
    return timeSlots;
  }
}

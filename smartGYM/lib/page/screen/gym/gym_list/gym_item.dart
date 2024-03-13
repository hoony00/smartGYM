import 'package:flutter/material.dart';
import 'package:gym_app/common/Colors/app_colors.dart';
import 'package:gym_app/common/colors/color_palette.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../common/font/pretendard.dart';
import '../../../../model/machine_data.dart';

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
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: ColorPalette.primaryColor,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.machine.name,
              style: Pretendard.wPrimaryColor_s20_w900,
            ),
            const SizedBox(height: 8),
            Text(
              '남은 예약 : ${widget.machine.totalSlots}',
              style: Pretendard.wPrimaryColor_s16_w700  ,
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
                    style: Pretendard.wPrimaryColor_s16_w500  ,
                  ),
                ),
              ],
            ),
            // 예약 가능 시간 펼치기
            Visibility(visible: isExpanded, child: Column(children: buildTimeSlots(widget.machine))),
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
          title: Text('예약 가능 시간 $i', style: Pretendard.wPrimaryColor_s12_w700,),
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

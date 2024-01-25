import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/widget/w_line.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/machine_data.dart';
import '../../model/notification_text.dart';
import 'gym_list/gym_item.dart';
import 'package:in_app_review/in_app_review.dart';

import 'gym_list/gym_list_.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            /// 공지사항
            child:  NotificationText.NOTIFICATION_TITLE
                .marquee(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    )
                .backgroundColor(Colors.cyan)
                .h4(context),
          ),
          buildDateRow(),
          // go로 이동시 replace
          // push로 이동시 스택 추가
          const Line(height: 2, color: Colors.cyan,),
          Expanded(child: GymMachineList(machines: machines)),

          ElevatedButton(
              onPressed: () => context.push('/test'),
              child: const Text('이동')),
        ],
      ),
    );
  }
}

Widget buildDateRow() {
  // 오늘 날짜
  DateTime today = DateTime.now();

  // 날짜 목록 생성 (7일치)
  List<Widget> dateWidgets = [];
  for (int i = 0; i < 7; i++) {
    DateTime date = today.add(Duration(days: i));
    dateWidgets.add(buildDateItem(date));
  }

  // Row에 날짜 목록 추가
  return Padding(
    padding: const EdgeInsets.fromLTRB(8,10,8,4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: dateWidgets,
    ),
  );
}

Widget buildDateItem(DateTime date) {
  // GestureDetector를 이용하여 터치 이벤트 처리
  return GestureDetector(
    onTap: () {
      // 날짜 클릭 시 수행할 동작 추가
      print('선택한 날짜: ${date.year}-${date.month}-${date.day}');
    },
    child: Container(
      padding: const EdgeInsets.fromLTRB(4, 8, 6, 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        '${date.day}일',
        style: const TextStyle(fontSize: 16.0),
      ),
    ),
  );
}

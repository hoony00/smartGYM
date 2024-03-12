import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/common/extension/context_extension.dart';
import 'package:velocity_x/velocity_x.dart';

class HelperScreen extends StatelessWidget {
  const HelperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("TestPage build");

    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 헬스 시간 선택
            VStack(
              [
                /// 좌우 스크롤 리스트
                const VxOrderedList(
                  [
                    "Hello",
                    "World",
                    "Flutter",
                    "Dart",
                    "VelocityX",
                  ],
                  type: VxListType.upperRoman,
                  color: Colors.blueAccent,
                  direction: Axis.horizontal,
                  shrinkWrap: false,
                ).wh(300, 50),

                10.heightBox,

                /// 좌우에 - + 버튼 있는 숫자 입력 위젯
                VxStepper(
                  onChange: (value) {
                    Vx.log(value);
                  },
                ),

                /// 평점 매기기 위젯
                VxRating(
                  onRatingUpdate: (value) {
                    print("매긴 별점 $value");
                  },
                  count: 5,
                  selectionColor: Colors.yellow,
                  size: 50,
                  stepInt: true,
                ),
                20.heightBox,

                /// 스와이프 가능한 리스트
                List.generate(
                    50,
                    (index) => "Item $index"
                        .text
                        .white
                        .make()
                        .box
                        .rounded
                        .alignCenter
                        .color(Vx.randomOpaqueColor)
                        .make()
                        .p4()).swiper(
                    height: context.isMobile ? 200 : 400,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index) {
                      Vx.log(index);
                    },
                    isFastScrollingEnabled: true,
                    scrollDirection:
                        context.isMobile ? Axis.horizontal : Axis.horizontal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

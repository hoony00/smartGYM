import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/common/extension/context_extension.dart';
import 'package:velocity_x/velocity_x.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/'),
              child: const Text('home'),
            ),
            "Card Sample"
                .text
                .makeCentered()
                .card
                .color(Vx.indigo500)
                .make()
                .h10(context)
                .onMouseHover((event) {
              Vx.log(event.distance);
            }).onMouseEnter((event) {
              Vx.log(event.delta);
            }),


            ExpansionTile(
                title:
                 '기본 정보'
                     .text
                     .bold
                     .color(Colors.cyan)
                     .size(context.deviceWidth * (16 / 360))
                     .make(),
                initiallyExpanded: true,
                backgroundColor: Colors.white,
                children: <Widget>[
                  const Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.05,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Text(
                              '기존 보증금',
                              style: TextStyle(
                                fontSize: 15 ,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '234만원',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 3,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: context.deviceHeight * 0.05,
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Text(
                              '기존 보증금',
                              style: TextStyle(
                                fontSize: 15 ,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '234만원',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
            VStack([
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
              VxStepper(onChange: (value) {
                Vx.log(value);
              },
        
              ),
              /// 평점 매기기 위젯
              VxRating(
                onRatingUpdate: (value) {print("매긴 별점 $value");},
                count: 5,
                selectionColor: Colors.yellow,
                size: 50,
                stepInt: true,
              ),
              20.heightBox,
              ///비밀번호 입력창 (좋음!!!)
               VxTextField(
                obscureText: true,
                borderType: VxTextFieldBorderType.roundLine,
                isPassword: true,
                hint: "비밀번호",
                maxLength: 8,
                maxLine: 1,
                prefixIcon: const Icon(Icons.lock),
                onSubmitted: (value) {
                  Vx.log(value);
                },
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

              /// 이미지
              "https://avatars0.githubusercontent.com/u/12619420?s=460&u=26db98cbde1dd34c7c67b85c240505a436b2c36d&v=4"
                  .circularNetworkImage(),
              /// 경계썬
              const VxDash(
                dashLength: 10,
                dashColor: Colors.red,
              ),

              const VxUnorderedList(
                ["Disc Item 1", "Disc Item 2"],
                primary: false,
              ),

            ])
        
        
        
        
          ],
        ),
      ),
    );
  }

}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/common/extension/context_extension.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => context.push('/'),
            child: const Text('home'),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: const Placeholder(),
          ),
          const Row(
            children: [
              Expanded(
                child: Text(
                  "GoRouterSouterouterState.of(ccontexcontexouterState.of(ccontexcontexState.of(ccontexcontexouterState.of(ccontexcontextate.of(ccontexcontexco",
                ),
              ),
            ],
          ),
          ExpansionTile(
              title: Text(
                '기본 정보',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.deviceWidth * (16 / 360),
                    color: Colors.black),
              ),
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
              ]),
        ],
      ),
    );
  }
}

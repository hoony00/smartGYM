import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecTestPage extends StatelessWidget {
  final String temp;

  // 생성자에 temp 값을 받도록 수정
  const SecTestPage({Key? key, required this.temp}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    print('SecTestPage');

    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage2'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/test');
          }
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.red,),
          child: const Text("TestPage2")),
    );
  }
}

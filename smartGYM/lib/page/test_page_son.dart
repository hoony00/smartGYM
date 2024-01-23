import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestPageSon extends StatelessWidget {
  const TestPageSon({super.key});

  @override
  Widget build(BuildContext context) {
    print(" 받아온 값  ${GoRouterState.of(context).pathParameters['id']}}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPageSon'),

      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,),
          child: const Text("TestPageSon")),
    );
  }
}

import 'package:flutter/material.dart';

class SecTestPage extends StatelessWidget {
  const SecTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage2'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.red,),
          child: const Text("TestPage2")),
    );
  }
}

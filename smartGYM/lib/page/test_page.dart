import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestPage'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,),
          child: ElevatedButton(onPressed: ()=> context.push('/'), child: const Text('home'))),
    );
  }
}

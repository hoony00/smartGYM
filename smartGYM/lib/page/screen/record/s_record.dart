import 'package:flutter/material.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  Widget build(BuildContext context) {


    print('RecordScreen');

    return const Scaffold(
      body: Center(
        child: Text('Record'),
      ),
    );
  }
}

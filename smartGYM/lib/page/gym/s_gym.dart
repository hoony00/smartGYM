import 'package:flutter/material.dart';

class GymScreen extends StatefulWidget {
  const GymScreen({super.key});

  @override
  State<GymScreen> createState() => _GymScreenState();
}

class _GymScreenState extends State<GymScreen> {


  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('gymScreen', style: TextStyle(color: Colors.blueAccent, fontSize: 30),));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    // go_router 버튼
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => context.push('/test'),
          child: const Text('이동'),
        ),
        // 바텀 네비게이션이 사라지는게 싫어
        ElevatedButton(
          onPressed: () => context.push('/home'),
          child: const Text('이동2'),
        ),
        ElevatedButton(
          onPressed: () => context.push('/testson'),
          child: const Text('이동3'),
        ),

      ],
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReservationScreen extends ConsumerStatefulWidget {
  const ReservationScreen({super.key});

  @override
  ConsumerState<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends ConsumerState<ReservationScreen> {
  @override
  Widget build(BuildContext context) {



    // assets/images/machine/에 있는 사진들을 다 담아오는 리스트
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              child: Image.asset('assets/images/machine/seatedRow.jpg'),
            );
          }
        ),
      ),
    ),);
  }
}

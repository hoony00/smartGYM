import 'package:flutter/material.dart';

import '../widget/w_line.dart';
import '../widget/w_tap.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:Tap(
          onTap: () {
            print('onTap');

          },
          child: Line(

            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
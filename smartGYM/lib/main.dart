import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/page/home/home.dart';
import 'package:gym_app/page/main_page.dart';
import 'package:gym_app/page/test/test_page.dart';
import 'package:gym_app/page/test/test_page2.dart';

import 'app.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: App()));
}

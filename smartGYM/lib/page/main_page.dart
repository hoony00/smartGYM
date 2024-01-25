import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/riverpod_page/rever_view.dart';
import 'package:gym_app/page/single_provider.dart';


class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key} );

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {

  @override
  Widget build(BuildContext context) {
    final String value = ref.watch(helloWorldProvider);

    return  Scaffold(
      appBar: AppBar(
        title: Text(value),
      ),
    //  body: const HomePage(),
      body: const RiverView(),
    );
  }
}


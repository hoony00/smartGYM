import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/page/screen/reservation/test_page.dart';

import '../common/Colors/app_colors.dart';
import '../common/colors/color_palette.dart';
import '../provider/page_index_provider.dart';
import 'Navigation/bottom_navigation/w_convex_bottom.dart';
import 'screen/gym/s_gym.dart';
import 'screen/record/s_record.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = ref.watch(pageIndexProvider);

    final List<Widget> body = [
      Visibility(visible: indexProvider == 0, child: ReservationScreen()),
      Visibility(visible: indexProvider == 1, child: GymScreen()),
      Visibility(visible: indexProvider == 2, child: RecordScreen()),
    ];

    return Scaffold(
      floatingActionButton: Visibility(
        visible: indexProvider == 0,
        child: FloatingActionButton(
          onPressed: () {
            print("floatingActionButton");
          },
          child: const Icon(Icons.add, color: ColorPalette.primaryColor),
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: indexProvider,
          children: body,
        ),
      ),
      bottomNavigationBar: const ConvexBottomNavigation(),
    );
  }
}





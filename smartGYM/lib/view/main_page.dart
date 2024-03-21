import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/provider/images/images_provider.dart';
import 'package:gym_app/view/screen/add/s_add.dart';
import 'package:gym_app/view/screen/reservation/s_recservation.dart';

import '../common/colors/color_palette.dart';
import '../provider/page_index_provider.dart';
import 'Navigation/bottom_navigation/w_convex_bottom.dart';
import 'screen/gym/s_gym.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    setMachineList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = ref.watch(pageIndexProvider);

    final List<Widget> body = [
      Visibility(visible: indexProvider == 0, child: const ReservationScreen()),
      Visibility(visible: indexProvider == 1, child: const GymScreen()),
      Visibility(visible: indexProvider == 2, child: const AddScreen()),
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

  /// 참여중인 카풀 수 조회
  void setMachineList() async {
    await ref.read(machineListProvider.notifier).getMachine();
  }

}





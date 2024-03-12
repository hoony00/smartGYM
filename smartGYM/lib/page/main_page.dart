import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/Colors/app_colors.dart';
import '../provider/page_index_provider.dart';
import 'bottom_navigation/w_convex_bottom.dart';
import 'screen/gym/home.dart';
import 'screen/helper/test_page.dart';
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
      Visibility(visible: indexProvider == 0, child: GymScreen()),
      Visibility(visible: indexProvider == 1, child: HelperScreen()),
      Visibility(visible: indexProvider == 2, child: RecordScreen()),
    ];

    return Scaffold(
      floatingActionButton: Visibility(
        visible: indexProvider == 1,
        child: FloatingActionButton(
          onPressed: () {
            print("floatingActionButton");
          },
          backgroundColor: AppColors.brightGrey,
          child: const Icon(Icons.add),
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





import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_app/common/Colors/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../provider/page_index_provider.dart';

class ConvexBottomNavigation extends ConsumerStatefulWidget {
  const ConvexBottomNavigation({super.key});

  @override
  ConsumerState<ConvexBottomNavigation> createState() =>
      _ConvexBottomNavigationState();
}

class _ConvexBottomNavigationState
    extends ConsumerState<ConvexBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final indexProvider = ref.watch(pageIndexProvider);

    final height = context.screenHeight;

    return ConvexAppBar.badge(
      {
      },
      badgeMargin: EdgeInsets.only(left: height * 0.028, bottom: height * 0.04),
      style: TabStyle.fixedCircle,
      backgroundColor: AppColors.faleBlue,
      elevation: 7,
      cornerRadius: 15,
      height: height * 0.09,
      // height: indexProvider == 2 ? height * 0.056 : height * 0.09,

      items: [
        TabItem(icon: Icons.calendar_today_outlined, title: '머신'),
        TabItem(icon: Icons.calendar_today_outlined, title: '투데이'),
        TabItem(icon: Icons.person_2_outlined, title: '운동 기록'),
      ],

      // 초기값
      initialActiveIndex: indexProvider,

      onTap: (int i) {

        // 화면 이동
        ref.read(pageIndexProvider.notifier).state = i;
      },
    );
  }
}

class ConvexStyleProvider extends StyleHook {
  late double height;

  ConvexStyleProvider({required this.height});

  @override
  double get activeIconSize => height * 0.05;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => height * 0.03;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(
        color: color, fontSize: height * 0.016, fontFamily: fontFamily);
  }
}



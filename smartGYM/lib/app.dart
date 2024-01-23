import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/page/home/home.dart';
import 'package:gym_app/page/main_page.dart';
import 'package:gym_app/page/test_page.dart';
import 'package:gym_app/page/test_page2.dart';
import 'package:gym_app/page/test_page_son.dart';
import 'package:nav/nav.dart';

class App extends StatefulWidget {
  const App({super.key});

  /// 글로벌 키
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) {
      return const Scaffold(
        body: Center(
          child: Text(
            '페이지가 삭제되거나 유효하지 않습니다.',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/test',
        name: 'test',
        builder: (context, state) => const TestPage(),
        routes: [
          GoRoute(
            path: 'testson',
            name: 'testson',
            builder: (context, state) {
              state.pathParameters['id'] = (state.extra as Map<String, dynamic>)['test'];
              return const TestPageSon();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/sectest',
        name: 'sectest',
        builder: (context, state) => const SecTestPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(),
    //  debugShowMaterialGrid: true, -> 그리드로 디자인 보여줌
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden: //Flutter 3.13 이하 버전을 쓰신다면 해당 라인을 삭제해주세요.
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}

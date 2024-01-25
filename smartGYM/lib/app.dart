import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/common/extension/context_extension.dart';
import 'package:gym_app/page/home/home.dart';
import 'package:gym_app/page/main_page.dart';
import 'package:gym_app/page/riverpod_page/rever_view.dart';
import 'package:gym_app/page/test/test_page.dart';
import 'package:gym_app/page/test/test_page2.dart';
import 'package:gym_app/page/test/test_page_son.dart';
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
    errorPageBuilder: (context, state) {
      return MaterialPage(child: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '페이지가 삭제되거나 유효하지 않습니다.',
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                context.go('/');
              }, child: const Text('홈으로 이동')),
            ],
          ),
        ),
      ));
    },
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const MainPage(),
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
              //   state.pathParameters['id'] = (state.extra as Map<String, dynamic>)['test'];
              return const TestPageSon();
            },
          ),
        ],
      ),
      GoRoute(
          path: '/sectest',
          name: 'sectest',
          builder: (context, state) {
            String temp =  (state.extra as Map<String, dynamic>)['sectest'];
            print("temp : $temp");
            return  SecTestPage(temp: temp);
          },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {

    double width = context.deviceWidth;
    double height = context.deviceHeight;

    return ScreenUtilInit(
      designSize: Size(width, height),
      child: MaterialApp.router(
        //라우트 상태를 전달해주는 함수
        routeInformationProvider: _router.routeInformationProvider,
        // routeInformationParser에서 변환된 값을 어떤 라우트로 보여줄 지 정하는 함수
        routeInformationParser: _router.routeInformationParser,
        //URI String을 상태 및 GoRouter에서 사용할 수 있는 형태로 변환해주는 함수
        routerDelegate: _router.routerDelegate,
        title: 'Flutter Demo',
        theme: ThemeData(),
        //  debugShowMaterialGrid: true, -> 그리드로 디자인 보여줌
      ),
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


/*
  현재 라우터를 받아오는 함수
  final _router = GoRouter.of(context);
  context.pop(); == Navigator.pop(context)
*/



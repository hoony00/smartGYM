import 'package:flutter/material.dart';
import 'package:gym_app/page/home/home.dart';
import 'package:gym_app/page/main_page.dart';
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



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
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

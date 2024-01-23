import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/page/home/home.dart';
import 'package:gym_app/page/main_page.dart';
import 'package:gym_app/page/test_page.dart';

import 'app.dart';

void getGoRoute() {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: 'main',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage(title: "MainPage");
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'test',
            path: 'test',
            builder: (BuildContext context, GoRouterState state) {
              return const TestPage();
            },
          ),
        ],
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
    ],
  );
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}





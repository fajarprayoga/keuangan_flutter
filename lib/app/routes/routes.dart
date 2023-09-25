import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keuangan_flutter/app/data/services/local/storage.dart';
import 'package:keuangan_flutter/app/routes/paths.dart';
import 'package:keuangan_flutter/app/screens/home/home_page.dart';
import 'package:keuangan_flutter/app/screens/login/view/login_view.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: Paths.home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        redirect: (context, _) => _redirect()),
    GoRoute(
      path: Paths.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
  ],
);

String _redirect() {
  String? token = prefs.getString('token');
  return token == null ? Paths.login : Paths.home;
}

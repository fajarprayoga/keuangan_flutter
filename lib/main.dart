import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keuangan_flutter/app/core/constans/dio.dart';
import 'package:keuangan_flutter/app/core/constans/theme.dart';
import 'package:keuangan_flutter/app/data/services/local/storage.dart';
import 'package:keuangan_flutter/app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // init flutter, to make sure all the widgets are ready
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    print("halo");
    dio.options.headers['Authorization'] = 'Bearer $token';
  }
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: 'Manajemen Keuangan',
        theme: appTheme);
  }
}

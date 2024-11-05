import 'package:flutter/material.dart';
import 'package:vactrack/router/router_config.dart';
import 'package:vactrack/theme.dart';

void main()async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: MyAppRouter().router.routeInformationProvider,
      routerDelegate: MyAppRouter().router.routerDelegate,
      routeInformationParser: MyAppRouter().router.routeInformationParser,
      title: 'VacTrack',
      theme: MyAppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}

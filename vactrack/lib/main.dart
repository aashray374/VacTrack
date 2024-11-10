import 'package:flutter/material.dart';
import 'package:vactrack/router/router_config.dart';
import 'package:vactrack/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a single instance of MyAppRouter.
    final myRouter = MyAppRouter().router;

    return MaterialApp.router(
      routeInformationProvider: myRouter.routeInformationProvider,
      routerDelegate: myRouter.routerDelegate,
      routeInformationParser: myRouter.routeInformationParser,
      title: 'VacTrack',
      theme: MyAppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}

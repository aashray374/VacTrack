import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:vactrack_admin/routes/app_route_config.dart';
import 'package:vactrack_admin/theme.dart';

void main() async{
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRoutes.router.routeInformationParser,
      routeInformationProvider: MyAppRoutes.router.routeInformationProvider,
      routerDelegate: MyAppRoutes.router.routerDelegate,
      theme: MyAppTheme.themeData,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/main.dart';
import 'package:vactrack/router/router_const.dart';
import 'package:vactrack/screens/home/home.dart';
import 'package:vactrack/screens/login/login.dart';
import 'package:vactrack/screens/onboarding/splash.dart';
import 'package:vactrack/video/display_video_list.dart';

class MyAppRouter {
  GoRouter router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
        name: MyRouteConstants.home,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Home());
        }),
    GoRoute(
        name: MyRouteConstants.splash,
        path: '/splash',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Splash());
        }),
    GoRoute(
        name: MyRouteConstants.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        }),
    GoRoute(
        name: MyRouteConstants.completeDetails,
        path: '/signUp',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        }),
    GoRoute(
        name: MyRouteConstants.infoVideos,
        path: '/infoVideos',
        pageBuilder: (context, state) {
          return MaterialPage(child: VideoScreen());
        }),
  ]);
}

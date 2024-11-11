import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/chat/chat_screen.dart';
import 'package:vactrack/models/vaccine.dart';
import 'package:vactrack/router/router_const.dart';
import 'package:vactrack/screens/child/child_details.dart';
import 'package:vactrack/screens/consultation/consultation_screen.dart';
import 'package:vactrack/screens/home/home.dart';
import 'package:vactrack/screens/login/login.dart';
import 'package:vactrack/screens/onboarding/splash.dart';
import 'package:vactrack/screens/schedule/schedule_screen.dart';
import 'package:vactrack/screens/vaccine/vaccine_details.dart';
import 'package:vactrack/screens/vaccine/vaccine_list.dart';
import 'package:vactrack/video/display_video_list.dart';
import '../models/child.dart';
import '../screens/child/add_child.dart';
import '../screens/child/child_list.dart';
import '../screens/map/map_screen.dart';

class MyAppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: MyRouteConstants.home,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Home());
        },
      ),
      GoRoute(
        name: MyRouteConstants.splash,
        path: '/splash',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Splash());
        },
      ),
      GoRoute(
        name: MyRouteConstants.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      // GoRoute(
      //   name: MyRouteConstants.completeDetails,
      //   path: '/signUp',
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(child: LoginScreen());
      //   },
      // ),
      GoRoute(
        name: MyRouteConstants.infoVideos,
        path: '/videos',
        pageBuilder: (context, state) {
          return MaterialPage(child: VideoScreen());
        },
      ),
      GoRoute(
        name: MyRouteConstants.allVaccines,
        path: '/allVaccines',
        pageBuilder: (context, state) {
          return const MaterialPage(child: VaccineList());
        },
      ),
      // GoRoute(
      //   name: MyRouteConstants.articles,
      //   path: '/articles',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: ArticlesScreen());
      //   },
      // ),
      GoRoute(
        name: MyRouteConstants.childList,
        path: '/ChildList',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ChildList());
        },
      ),
      GoRoute(
        name: MyRouteConstants.childInfo,
        path: '/ChildInfo',
        pageBuilder: (context, state) {
          final child = state.extra as Child;
          return MaterialPage(child: ChildDetails(child: child));
        },
      ),
      GoRoute(
        name: MyRouteConstants.chatScreen,
        path: '/chat',
        pageBuilder: (context, state) {
          final String chatId = state.extra as String;
          return MaterialPage(child: ChatScreen(chatId: chatId));
        },
      ),
      GoRoute(
        name: MyRouteConstants.mapScreen,
        path: '/mapScreen',
        pageBuilder: (context, state) {
          return MaterialPage(child: MapScreen());
        },
      ),
      // GoRoute(
      //   name: MyRouteConstants.appointmentsScreen,
      //   path: '/appointments',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: AppointmentsScreen());
      //   },
      // ),
      GoRoute(
        name: MyRouteConstants.addChild,
        path: '/addChild',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddChild());
        },
      ),
      // GoRoute(
      //   name: MyRouteConstants.appointmentDetails,
      //   path: '/appointmentDetails',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: AppointmentDetailsScreen());
      //   },
      // ),
      GoRoute(
        name: MyRouteConstants.schedule,
        path: '/schedule',
        pageBuilder: (context, state) {
          final child = state.extra as Child;
          return MaterialPage(child: ScheduleScreen(child: child));
        },
      ),
      // GoRoute(
      //   name: MyRouteConstants.consultation,
      //   path: '/consultation',
      //   pageBuilder: (context, state) {
      //     return MaterialPage(child: ConsultationScreen());
      //   },
      // ),
      GoRoute(
          name: MyRouteConstants.detailsVaccine,
          path: "/vaccineDetails",
          pageBuilder: (context,state){
            final vaccine = state.extra as Vaccine;
            return MaterialPage(child: VaccineDetails(vaccine: vaccine));
          }
      ),
      GoRoute(
          name: MyRouteConstants.consultationScreen,
          path: "/consultationScreen",
          pageBuilder: (context,state){
            return MaterialPage(child: ConsultationScreen());
          }
      ),
    ],
  );
}

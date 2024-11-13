import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack_admin/routes/app_routes_constants.dart';
import 'package:vactrack_admin/screens/NotFound/page_not_found.dart';
import 'package:vactrack_admin/screens/login/hospital_signup.dart';
import 'package:vactrack_admin/screens/login/signUp.dart';
import 'package:vactrack_admin/screens/login/login.dart';
import 'package:vactrack_admin/screens/profile/profile.dart';
import 'package:vactrack_admin/screens/home/home.dart';

import '../screens/home/landing_page.dart';

class MyAppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: MyRoutesConstants.home,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LandingPage());
        },
      ),
      GoRoute(
        name: MyRoutesConstants.hospitalSignup,
        path: '/hospitalSignUp',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HospitalRegistrationPage());
        },
      ),
      GoRoute(
        name: MyRoutesConstants.profile,
        path: '/profile',
        pageBuilder: (context, state) {
          return const MaterialPage(child: Profile());
        },
      ),
      GoRoute(
        name: MyRoutesConstants.login,
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: MyRoutesConstants.signup,
        path: '/signUp',
        pageBuilder: (context, state) {
          return const MaterialPage(child: HospitalDetailsForm());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: PageNotFound());
    },
  );
}

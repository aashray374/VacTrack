import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:go_router/go_router.dart';
import 'package:vactrack/router/router_const.dart';
import '../../const.dart';
import '../../services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<String?> _authUser(LoginData data) async {
    String? result = await AuthServices.signIn(data.name, data.password);
    return result;
  }

  Future<String?> _signupUser(SignupData data) async {
    if (data.name == null || data.password == null) {
      return Future.value("Please fill all details");
    }
    String? result = await AuthServices.signUp(data.name!, data.password!);
    return result;
  }

  Future<String> _recoverPassword(String name) async {
    return await AuthServices.resetPassword(name);
  }


  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.title,
      onLogin: (LoginData data) async {
        String? result = await _authUser(data);
        if (result == null) {
          GoRouter.of(context).pushReplacementNamed(MyRouteConstants.home);
        } else {
          return result;
        }
      },
      onSignup: (SignupData data) async {
        String? result = await _signupUser(data);
        if (result == null) {

        } else {
          return result;
        }
        GoRouter.of(context).pushReplacementNamed(MyRouteConstants.home);
      },
      onSubmitAnimationCompleted: () {
        // Optional: Add any animation completion logic here
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}

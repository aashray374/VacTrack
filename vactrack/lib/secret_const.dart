import 'package:shared_preferences/shared_preferences.dart';

class SecretConstants{
  static String ip = "192.168.110.57:3000";
  static String token = "";


  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    SecretConstants.token = token!;
    return token;

  }
}
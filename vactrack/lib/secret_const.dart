import 'package:shared_preferences/shared_preferences.dart';

class SecretConstants{
  static String ip = "";
  static String token = "";


  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    SecretConstants.token = token!;
    return token;

  }
}
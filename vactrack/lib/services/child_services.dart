import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/child.dart';
import '../secret_const.dart';

class ChildServices {



  static List<Child> children = []; // Consider using a state management solution for live updates

  static Future<List<Child>> fetchChildren(String token) async {
    final response = await http.get(
      Uri.parse('http://${SecretConstants.ip}/getChildren'),
      headers: <String, String>{
        'Authorization': SecretConstants.token==""? SecretConstants.getToken().toString(): SecretConstants.token, // Include the token in the request
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['children'] != null) {
        children = List<Child>.from(
            data['children'].map((child) => Child.fromJson(child))
        );
        return children; // Return the list of children
      } else {
        return []; // Return an empty list if no children are found
      }
    } else {
      throw Exception('Failed to fetch children: ${response.statusCode}');
    }
  }

  static Future<Void> addChild() async{
    
  }
}
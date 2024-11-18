import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/child.dart';
import '../secret_const.dart';

class ChildServices {



  static List<Child> children = []; // Consider using a state management solution for live updates

  static Future<List<Child>> fetchChildren(String token) async {
    final response = await http.get(
      Uri.parse('http://${SecretConstants.ip}/api/getChildren'),
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

  static Future<void> addChild({
    required String name,
    required String adahar,
    required int gender,
    required String dob,
  }) async {
    try {
      // API Endpoint
      final String url = 'http://${SecretConstants.ip}/api/addChild';

      // Prepare headers
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': SecretConstants.token.isEmpty
            ? SecretConstants.getToken().toString()
            : SecretConstants.token,
      };

      // Prepare body
      final body = jsonEncode({
        'name': name,
        'adahar': adahar, // Ensure the spelling matches the backend
        'gender': gender,
        'dob': dob,
      });

      // Send POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('Child added successfully: ${jsonResponse['child']}');
      } else {
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vactrack/secret_const.dart';

class AuthServices extends ChangeNotifier {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore database = FirebaseFirestore.instance;

  static Future<String?> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://${SecretConstants.ip}/api/parent/login'),
        // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      print(response);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          final token = data['token'];

          // Store the token in shared preferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          SecretConstants.token = token;
          // Navigate to the home page or desired screen
          // Navigator.pushReplacementNamed(
          //     context, '/home'); // Replace with your home route
        } else {
          // Show error message from response body (if available)
          final errorMessage = data['msg'];
          if (errorMessage != null) {
            return errorMessage;
          } else {
            return 'Login failed.'; // Generic error if no specific message
          }
        }
      } else {
        // Show error message for non-200 status code
        return 'Login failed. Server error ${response.statusCode}';
      }
    } catch (e) {

      print(e);
      return "An error occurred: $e";
    }
  }

  static Future<String> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return "Password reset email sent. Please check your inbox.";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An unknown error occurred";
    } catch (e) {
      return "An error occurred: $e";
    }
  }

  static Future<String?> signUp(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('http://${SecretConstants.ip}/api/parent/create'),
        // Replace with your API endpoint
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true) {
          final token = data['token'];

          // Store the token in shared preferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);


          return null;
        } else {
          final errorMessage = data['msg'];
          return errorMessage ?? 'Sign-up failed.'; // Use provided error message or generic
        }
      } else {
        return 'Sign-up failed. Server error ${response.statusCode}';
      }
    } catch (e) {
      return "An error occurred: $e";
    }
  }



}

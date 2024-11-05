import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore database = FirebaseFirestore.instance;
  bool verified = false;
  bool loggedIn = FirebaseAuth.instance.currentUser == null;

  void setVerified(bool value) {
    verified = value;
    notifyListeners();
  }

  void setLoggedIn(bool value) {
    loggedIn = value;
    notifyListeners();
  }

  static Future<String?> signIn(String email, String password) async {
    try {
      QuerySnapshot querySnapshot = await database
          .collection("Hospitals")
          .where("email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot hospitalDoc = querySnapshot.docs[0];
        AuthServices authService = AuthServices();
        if (hospitalDoc['verified'] == true) {
          authService.setVerified(true);
        }
        await auth.signInWithEmailAndPassword(email: email, password: password);
        authService.setLoggedIn(true);
        return null;
      } else {
        return "Sign in First";
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await database.collection("Hospitals").doc(userCredential.user!.uid).set({
        "details": false,
        "verified": false,
        "email": email,
      });
      AuthServices authService = AuthServices();
      authService.setLoggedIn(true);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An unknown error occurred";
    } catch (e) {
      return "An error occurred: $e";
    }
  }

  Future<void> checkVerified() async {
    try {
      DocumentSnapshot doc = await database
          .collection("Hospitals")
          .doc(auth.currentUser!.uid)
          .get();
      if (doc.exists && doc['verified'] == true) {
        setVerified(true);
      }
    } catch (e) {
      return;
    }
  }

  Future<String?> setHospitalDetails({
    required String name,
    required String address,
    required String contactNumber,
    required String email,
    required String website,
  }) async {
    try {
      await database.collection("Hospitals").doc(auth.currentUser!.uid).set({
        'name': name,
        'address': address,
        'contactNumber': contactNumber,
        'email': email,
        'website': website,
      });
      return null;
    } catch (e) {
      return "Error setting hospital details: $e";
    }
  }
}

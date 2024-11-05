import 'package:flutter/material.dart';

class MyAppTheme {
  static ThemeData theme = ThemeData().copyWith(
    cardTheme: const CardTheme().copyWith(
      shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(80),
      )),
      shadowColor: Colors.blue,
      elevation: 4,
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.blueAccent),
      ),
    )
  );
}

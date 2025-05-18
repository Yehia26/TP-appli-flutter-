import 'package:flutter/material.dart';

class AppTheme{
  ThemeData getTheme() {
    return ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontFamily: "Ubuntu"),
        headlineMedium: TextStyle(
          fontFamily: "Ubuntu", 
          fontWeight: FontWeight.bold, 
          fontSize: 18
        )
      )
    );
  }
}
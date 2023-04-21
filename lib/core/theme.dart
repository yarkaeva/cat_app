import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme => ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearMinHeight: 6,
          linearTrackColor: Color.fromARGB(255, 192, 192, 192),
          color: Colors.teal,
        ),
        appBarTheme: const AppBarTheme(
          toolbarTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.teal),
            splashFactory: NoSplash.splashFactory,
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 25,
            letterSpacing: 0.25,
            fontWeight: FontWeight.w700,
            color: Colors.teal,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          bodySmall: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
            color: Colors.blueGrey,
          ),
        ),
      );
}

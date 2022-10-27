import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../gen/colors.gen.dart';

class CuitTheme {
  static final roundedBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0));

  static UnderlineInputBorder textFieldBorder(double radius) {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black26, width: 1.0),
    );
  }

  static UnderlineInputBorder focusedTextFieldBorder(double radius) {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorName.sunglow, width: 2.0),
    );
  }

  static UnderlineInputBorder errorTextFieldBorder(double radius) {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.0),
    );
  }

  static final ThemeData theme = ThemeData(
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    dialogTheme: const DialogTheme(
      contentTextStyle: TextStyle(
        color: Colors.black54,
        fontSize: 16.0,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(foregroundColor: Colors.black),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.black),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
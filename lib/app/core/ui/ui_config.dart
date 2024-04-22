import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => "CuidaPet";

  static ThemeData get theme => ThemeData(
        primaryColor: const Color(0xffa8ce4b),
        primaryColorDark: const Color(0xff689f38),
        primaryColorLight: const Color(0xffdde9c7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffa8ce4b),
        ),
      );
}

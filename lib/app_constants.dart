import 'package:flutter/material.dart';

class AppConstants {
  // Application Colors
  static Color? seedColor = Colors.blueAccent;
  static Color? shadowColor = const Color.fromARGB(54, 68, 137, 255);
  static Color? accentColor = Colors.blueAccent[700];

  // Psychological Colors
  static Color? warningColor = Colors.amber[800];
  static Color? warningShadow = const Color(0x25FFC107);

  static Color? dangerColor = Colors.red[800];
  static Color? dangerShadow = const Color(0x25F44336);

  static Color? successColor = Colors.green[800];
  static Color? successShadow = const Color.fromARGB(36, 76, 175, 79);

  // themes
  static ThemeData? lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppConstants.seedColor as Color,
    ),
  );

  static ThemeData? darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF272727),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppConstants.seedColor as Color,
    ),
  );
}

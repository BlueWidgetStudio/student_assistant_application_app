import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:student_assistant_application_app/views/pages/register_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Student Assistant Application System',
      themeMode: ThemeMode.light,

      theme: AppConstants.lightTheme,
      darkTheme: AppConstants.darkTheme,

      home: Scaffold(body: RegisterPage()),
    );
  }
}

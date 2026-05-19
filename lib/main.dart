import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:student_assistant_application_app/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fijyfhmwuyqtphoanhsk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpanlmaG13dXlxdHBob2FuaHNrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkxNzg0MjksImV4cCI6MjA5NDc1NDQyOX0.gISmJQLTTYWTaTyBi9EwIuK92o4thz4ITj2uU_xkHP0',
  );
  runApp(const App());
}

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

      home: const AuthGate(),
    );
  }
}

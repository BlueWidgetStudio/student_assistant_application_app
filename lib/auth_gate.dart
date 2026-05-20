import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/views/pages/app_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'views/pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    if (session != null) {
      return const AppPage();
    }

    return const LoginPage();
  }
}

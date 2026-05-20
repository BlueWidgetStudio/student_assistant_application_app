import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_assistant_application_app/viewmodels/bottom_navigation_view_model.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationViewModel>(
      builder: (context, model, child) {
        return IndexedStack(index: model.currentIndex, children: model.pages);
      },
    );
  }
}

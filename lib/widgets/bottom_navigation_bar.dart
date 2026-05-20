import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_assistant_application_app/app_constants.dart';
import 'package:student_assistant_application_app/viewmodels/bottom_navigation_view_model.dart';

class CustomBottonNavigation extends StatelessWidget {
  const CustomBottonNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<BottomNavigationViewModel>().currentIndex;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          // Current Index from state management
          currentIndex: currentIndex,

          // Bottom Navigation Logic
          onTap: (value) {
            context.read<BottomNavigationViewModel>().updateCurrentIndex(value);
          },

          // Bottom Navigation Layout
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: const Color.fromARGB(255, 224, 224, 224),
          backgroundColor: AppConstants.accentColor,

          // Botton Navigation Items
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner),
              label: 'My Applications',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}

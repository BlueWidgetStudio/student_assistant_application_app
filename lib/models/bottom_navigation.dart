import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/views/pages/applications_page.dart';
import 'package:student_assistant_application_app/views/pages/home_page.dart';
import 'package:student_assistant_application_app/views/pages/profile_page.dart';

class BottomNavigation {
  final int currentIndex;
  final List<Widget> pages = [HomePage(), ApplicationsPage(), ProfilePage()];

  BottomNavigation({required this.currentIndex});

  BottomNavigation copyWith(int? currentIndex) {
    return BottomNavigation(currentIndex: currentIndex ?? this.currentIndex);
  }
}

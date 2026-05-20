import 'package:flutter/material.dart';
import 'package:student_assistant_application_app/models/bottom_navigation.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  BottomNavigation _bottomNavigation = BottomNavigation(currentIndex: 0);

  int get currentIndex => _bottomNavigation.currentIndex;
  List<Widget> get pages => _bottomNavigation.pages;

  void updateCurrentIndex(int? currentIndex) {
    _bottomNavigation = _bottomNavigation.copyWith(currentIndex);
    notifyListeners();
  }
}

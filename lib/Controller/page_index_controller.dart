import 'package:flutter/material.dart';

class PageIndexController extends ChangeNotifier {
  int _selectedIndex = 0;
  get selectedIndex => _selectedIndex;
  set setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

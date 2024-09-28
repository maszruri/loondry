import 'package:flutter/material.dart';

class HomeViewmodel extends ChangeNotifier {
  int _pages = 0;
  int get pages => _pages;

  setPages(int page) {
    _pages = page;
    notifyListeners();
  }
}

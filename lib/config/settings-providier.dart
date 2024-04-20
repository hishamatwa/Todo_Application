import 'package:flutter/material.dart';

class providier extends ChangeNotifier {
  int currntindex = 0;
  ThemeMode currentTheme = ThemeMode.light;

  incindex(int index) {
    currntindex = index;
    notifyListeners();
  }
  changethem(ThemeMode newtheme){
    if(currentTheme==newtheme)
      return ;
    currentTheme=newtheme;
    notifyListeners();
  }
  bool isdark() {
    return currentTheme == ThemeMode.dark;
  }
}

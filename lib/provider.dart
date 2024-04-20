import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
 ThemeMode themeMode = ThemeMode.dark;

 changeTheme(ThemeMode x){
   if(x == themeMode) return;
   themeMode = x;
   notifyListeners();
 }
 isDark(){
   return themeMode==ThemeMode.dark;
 }
}
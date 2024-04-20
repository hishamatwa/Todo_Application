

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:todo_app/register.dart';
import 'package:todo_app/themes/theme_controll.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => ProviderService(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ProviderService>(context);

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: vm.themeMode,
      theme: ThemeController.lightTheme,
      darkTheme: ThemeController.darkTheme,
      routes: {
        SplashScreen.routeName : (context)=> SplashScreen(),
        HomeScreen.routeName : (context)=> HomeScreen.himescreen(),
        LoginScreen.routeName : (context)=> LoginScreen(),
        RegisterScreen.routeName : (context)=> RegisterScreen(),
      },
      initialRoute : SplashScreen.routeName,
      builder: EasyLoading.init(),



    );
  }
}
class SplashScreen extends StatelessWidget {
  static String routeName ="/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3) , ()=> Navigator.pushReplacementNamed(context, LoginScreen.routeName));
    var vm = Provider.of<ProviderService>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: vm.isDark() ?  const AssetImage("assets/dark_mode/splash_dark.png") : const AssetImage("assets/light_mode/splash_light.png"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}


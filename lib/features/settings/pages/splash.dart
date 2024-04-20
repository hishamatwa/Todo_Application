import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/tasks/mainlayoutView.dart';

import '../../../config/settings-providier.dart';

class splash extends StatefulWidget {
  static const String routename ="splash";
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, homescreen.routename);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<providier>(context);
    var mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        vm.isdark() ? "assets/images/splash-dark-theme.png":
        "assets/images/splash-light-theme.png",
        fit: BoxFit.cover,
        height: mediaQuery.height,
        width: mediaQuery.width,
      ),
    );
  }
}

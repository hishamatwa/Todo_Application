import 'package:flutter/material.dart';

class loginscreen extends StatelessWidget {
  static const String routename ="loginscreen";
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Column(
          children: [
            Text("Welcome Back!")
          ],
        ),
      )
    );
  }
}

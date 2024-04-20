import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/switch_button.dart';

import '../fonts/fonts.dart';
import '../provider/provider.dart';
import '../themes/theme_controll.dart';
import 'login_screen.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var vm =Provider.of<ProviderService>(context);
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width,
          height: size.height * 0.22,
          decoration: BoxDecoration(
            color: ThemeController.primaryColor,
          ),
          padding: const EdgeInsets.only(top: 70, left: 20),
          child:  Text("Settings",
              style: TextStyle(
                  color: vm.isDark()? Color(0xFF060E1E):Colors.white,
                  fontFamily: "Poppins",
                  fontSize: 22,
                  fontWeight: FontWeight.w700)),
        ),
        Container(
            padding: const EdgeInsets.all(30),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Theme mode",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: vm.isDark()? Colors.white:Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SwitchButton(
                      enabled:() {vm.changeTheme(ThemeMode.dark);},
                      disabled: (){vm.changeTheme(ThemeMode.light);},
                    ),

                  ],
                ),
                const SizedBox(height: 50,),
                ElevatedButton(onPressed: () {
                 Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,(route) => false,);
                 vm.index=0;
                },
                  style:ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)
                  ) , child: Text("Log out",
                  style: TextStyle(
                    fontFamily: Fontss.Poppins,
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  ),
                ),

                )
              ],
            ))
      ],
    );
  }
}

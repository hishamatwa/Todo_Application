import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/bottomSheetVIew.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/themes/theme_controll.dart';

import '../provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen.himescreen({super.key});
  static String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var uid = ModalRoute.of(context)?.settings.arguments as String?;
    var vm = Provider.of<ProviderService>(context);
    vm.uid = uid;
    print(vm.uid);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(70),
          side: BorderSide(
            color: vm.isDark()? const Color(0xFF141922):Colors.white,
            width: 4
          )
        ),
        onPressed: (){
          vm.currentDate =DateTime.now();
          showModalBottomSheet(
            isScrollControlled: true,
              context: context,
              builder: (context) => BottomSheetView(uid: uid),
              backgroundColor: Colors.transparent,
              isDismissible: true

          );
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: vm.isDark()? const Color(0xFF060E1E):const Color(0xFFDFECDB),
      bottomNavigationBar: BottomAppBar(
        color: vm.isDark()? const Color(0xFF141922):Colors.white,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex:vm.index,
          onTap: (value){
            vm.index=value;
            setState(() {
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list),label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),
          ],
        ),
      ),
    body: vm.widgets[vm.index],


    );


  }
}

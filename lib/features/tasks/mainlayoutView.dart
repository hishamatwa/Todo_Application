import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/constants/application-theme.dart';

import '../../config/settings-providier.dart';

class homescreen extends StatefulWidget {
  static const String routename="homescreen";
    homescreen({super.key});

  @override
  State<homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    var vm=Provider.of<providier>(context);
    var mediaQuery=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 413,
            height: 157,
            color: apptheme.primarycolor,
            child: Text("To Do List"),
            padding: EdgeInsets.symmetric(
              vertical: 70,
              horizontal: 50
            ),
          ),
           // EasyInfiniteDateTimeLine(
           //   controller: _controller,
           //   firstDate: DateTime(2023),
           //   focusDate: _focusDate,
           //   lastDate: DateTime(2023, 12, 31),
           //   onDateChange: (selectedDate) {
           //     setState(() {
           //       _focusDate = selectedDate;
           //     });
           //   },
           // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},child: Icon(Icons.add,size: 32,color: Colors.white,),
      ),
     bottomNavigationBar: BottomAppBar(
       elevation: 0,
       shape: CircularNotchedRectangle(),
       notchMargin: 15,
       child: BottomNavigationBar(
         currentIndex: vm.currntindex,
         onTap: vm.incindex,
         elevation: 0,
         backgroundColor: Colors.white,
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.list),
           label: "Taska"),
           BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),
               label: "Settings"),

         ],
       ),
     ),
    );
  }
}

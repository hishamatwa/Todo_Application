import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:todo_app/themes/theme_controll.dart';

import 'firebase/task_model.dart';
import 'fonts/fonts.dart';

class TaskView extends StatefulWidget {
  TaskModel taskModel;
  //Function deleteTask ;
  TaskView({super.key,required this.taskModel});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var vm = Provider.of<ProviderService>(context);
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
      decoration: BoxDecoration(
        //color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context){
                FireBaseUtils().deleteFromFireStore(widget.taskModel.id, vm.uid);
              } ,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              spacing: 0,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: size.height*0.14,
          //margin: const EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
          decoration: BoxDecoration(
            color: vm.isDark() ? Color(0xFF141922) : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18 ,horizontal: 15),
              child: Row(
                children: [
                  VerticalDivider(
                    color: widget.taskModel.isdone == true?Colors.green:ThemeController.primaryColor,
                    thickness: 4,
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.taskModel.taskName,
                        style: TextStyle(
                          fontFamily: Fontss.Poppins,
                          color: widget.taskModel.isdone == true?Colors.green:ThemeController.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.access_time,
                            color: widget.taskModel.isdone == true?Colors.green:ThemeController.primaryColor,
                          ),
                          const SizedBox(width: 5,),
                          Text(formatDate(widget.taskModel.date,[d, ' ', M, ' ', yyyy]).toString(),
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: widget.taskModel.isdone == true?Colors.green:ThemeController.primaryColor,
                          ),
                          ),

                        ],
                      )
                    ],
                  ),
                  const Spacer(),

                  widget.taskModel.isdone == true?
                  Text("Done!",
                  style: TextStyle(
                    fontFamily: Fontss.Poppins,
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  )
                      :
                    InkWell(
                      onTap: () {
                          FireBaseUtils().updateFromFireStore(widget.taskModel.id, vm.uid);
                          setState(() {

                          });
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ThemeController.primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(Icons.done ,color: Colors.white,size: 30,) ,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/task_view.dart';
import 'package:todo_app/themes/theme_controll.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../provider/provider.dart';

class TaskList extends StatefulWidget {

  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final EasyInfiniteDateTimelineController _controller =
  EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ProviderService>(context);
    var size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            //alignment: const Alignment(0,2),
            children: [
              Positioned(
                top: 0,
                child: Container(
                  width: size.width,
                  height: size.height * 0.22,
                  decoration: BoxDecoration(
                    color: ThemeController.primaryColor,
                  ),
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text("Tasks List",
                      style: TextStyle(
                          color: vm.isDark() ? const Color(0xFF060E1E) : Colors
                              .white,
                          fontFamily: "Poppins",
                          fontSize: 22,
                          fontWeight: FontWeight.w700
                      )

                  ),
                ),
              ),
              Positioned(
                top: 140, // Adjust the top position as needed
                child: SizedBox(
                  width: size.width,
                  height: 200, // Adjust the height as needed
                  child: EasyInfiniteDateTimeLine(
                    controller: _controller,
                    firstDate: DateTime.now(),
                    focusDate: vm.currentDate,
                    lastDate: DateTime.now().add(const Duration(days: 732)),
                    showTimelineHeader: false,
                    onDateChange: (selectedDate) {
                      vm.currentDate = selectedDate;
                      setState(() {});
                    },
                    dayProps: EasyDayProps(
                      height: 90,
                      todayHighlightStyle: TodayHighlightStyle.withBackground,
                      inactiveDayStyle: DayStyle(
                          dayNumStyle:  TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: vm.isDark()? Colors.white:Colors.black,),
                          dayStrStyle:  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: vm.isDark()? Colors.white:Colors.black),
                          monthStrStyle:  TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: vm.isDark()? Colors.white:Colors.black),
                          decoration: BoxDecoration(
                            color: vm.isDark()? Color(0xFF141922):Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          )),
                      activeDayStyle: DayStyle(
                          monthStrStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                          dayStrStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,),
                          decoration: BoxDecoration(
                              color: const Color(0xFF5D9CEC),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2, color: Colors.white))),
                      todayStyle: DayStyle(
                          dayNumStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5D9CEC)),
                          dayStrStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5D9CEC)),
                          monthStrStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF5D9CEC)),
                          decoration: BoxDecoration(
                            color: vm.isDark()? Color(0xFF141922):Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  )
                ),
              ),
            ],),
        ),
        StreamBuilder(
          stream: FireBaseUtils().getFromFireStore(vm.uid,vm.currentDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Replace with your loading widget
            } else if (snapshot.hasError) {
              print("Error: ${snapshot.error}");
              return Text("Error fetching data: ${snapshot.error}");
            } else {
              if (snapshot.data == null) {
                print("Data is null");
                return Text("Data is null");
              }
              var tasks = snapshot.data?.docs.map((e) => e.data()).toList()??[];
              print(tasks);
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => TaskView(
                    taskModel: tasks[index],
                  ),
                ),
              );
            }
          },

        )


      ],
    );
  }
}

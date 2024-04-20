import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/date_format.dart';
import 'package:todo_app/firebase/firebase_utils.dart';
import 'package:todo_app/firebase/task_model.dart';
import 'package:todo_app/provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'fonts/fonts.dart';

class BottomSheetView extends StatefulWidget {
  final String? uid;

  BottomSheetView({super.key, required this.uid});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  var formKey = GlobalKey<FormState>();

  var taskNameController = TextEditingController();

  var taskDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<ProviderService>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.73,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: BoxDecoration(
        color: vm.isDark() ? Color(0xFF141922) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Expanded(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: vm.isDark() ? Colors.white : Colors.black,
                  fontFamily: Fontss.Poppins,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                        controller: taskNameController,
                        style: TextStyle(
                          color: vm.isDark() ? Colors.white : Colors.black,
                          fontSize: 20
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter a task name";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: vm.isDark() ? Colors.white : Colors.black,
                            )),
                            labelText: "Task Name",
                            labelStyle: TextStyle(
                              color: vm.isDark() ? Colors.white : Colors.black,
                            ))),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: taskDescriptionController,
                      style: TextStyle(
                        color: vm.isDark() ? Colors.white : Colors.black,
                          fontSize: 20
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter a description";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: vm.isDark() ? Colors.white : Colors.black,
                          )),
                          labelText: "Task description",
                          labelStyle: TextStyle(
                            color: vm.isDark() ? Colors.white : Colors.black,
                          )),
                      maxLines: 3,
                      maxLength: 150,
                    ),
                    Spacer(),
                    Text(
                      "Select Time",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: vm.isDark() ? Colors.white : Colors.black,
                        fontFamily: Fontss.Poppins,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        vm.timePicker(context);
                      },
                      child: Text(
                        formatDate(vm.currentDate, [dd, ' - ', mm, ' - ', yyyy]),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: vm.isDark() ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontFamily: Fontss.Poppins,
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                        onPressed: () {
                          formKey.currentState!.validate();
                          if(formKey.currentState!.validate()) {
                            FireBaseUtils().fireStoreAdd(
                              widget.uid,
                              TaskModel(
                                  isdone: false,
                                  taskName: taskNameController.text,
                                  taskDescription: taskDescriptionController.text,
                                  date: dateFormat(vm.currentDate)));

                          Navigator.pop(context);
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.success(
                                message:
                                'Task Added successfully',
                              ),
                            );
                          }
                          setState(() {

                          });
                          print(DateTime.fromMillisecondsSinceEpoch(dateFormat(vm.currentDate).millisecondsSinceEpoch));
                        },
                        child: Text(
                          "Add Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: Fontss.Poppins,
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

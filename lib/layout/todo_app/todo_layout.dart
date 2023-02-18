import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_project/shared/components/components.dart';
import 'package:flutter_project/shared/cubit/cubit.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../shared/components/constants.dart';
import '../../shared/cubit/states.dart';

// 1. create database
// 2. create tables
// 3. open darabase
// 4. insert to database
// 5. get from database
// 6. update in database
// 7. delete from database

class TodoLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: state is AppGetDatabaseLoadingState
                ? Center(child: CircularProgressIndicator())
                : cubit.currentScreen[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      titleController.text,
                      dateController.text,
                      timeController.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormField(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      text: 'Task title',
                                      prefix: Icons.title,
                                      valide: (value) {
                                        if (value!.isEmpty) {
                                          return 'title must be not null';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      text: 'Task time',
                                      prefix: Icons.watch_later_outlined,
                                      onTap: () {
                                        showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        ).then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                        });
                                      },
                                      valide: (value) {
                                        if (value!.isEmpty) {
                                          return 'time must be not null';
                                        }
                                        return null;
                                      }),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  defaultFormField(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      text: 'Task date',
                                      prefix: Icons.date_range_rounded,
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2022-12-12'),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        });
                                      },
                                      valide: (value) {
                                        if (value!.isEmpty) {
                                          return 'date must be not null';
                                        }
                                        return null;
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                        elevation: 30.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_box_outlined,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

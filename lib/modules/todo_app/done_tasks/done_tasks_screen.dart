import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/shared/components/components.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';



class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context,state) {},
      builder: (context , state )
      {
        return ConditionalBuilder(
          condition: AppCubit.get(context).doneTasks.length > 0,
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => buildTaskItem(AppCubit.get(context).doneTasks[index] , context),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 3.0,
                color: Colors.grey[300],
              ),
              itemCount: AppCubit.get(context).doneTasks.length),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 50.0,
                ),
                Text('No tasks yet, Please add some tasks!'),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_project/layout/news_app/cubit/states.dart';
import 'package:flutter_project/shared/components/components.dart';

class BusinessScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state ) {} ,
      builder: (context, state )
      {

        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(list[index] ,context),
            separatorBuilder: (context , index) => myDivider(),
            itemCount: 10,
          ),
          fallback:  (context) => Center(child: CircularProgressIndicator()) ,
        );
      },
    );
  }
}

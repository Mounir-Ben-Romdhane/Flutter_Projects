import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/news_app/cubit/cubit.dart';
import 'package:flutter_project/layout/news_app/news_layout.dart';
import 'package:flutter_project/layout/todo_app/todo_layout.dart';
import 'package:flutter_project/modules/bmi_app/bmi/bmi_screen.dart';
import 'package:flutter_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter_project/shared/components/constants.dart';
import 'package:flutter_project/shared/cubit/cubit.dart';
import 'package:flutter_project/shared/cubit/states.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:flutter_project/shared/network/remote/dio_helper.dart';
import 'package:flutter_project/shared/styles/themes.dart';
import 'package:hexcolor/hexcolor.dart';

import 'modules/basics_app/messenger/messenger_screen.dart';
import 'shared/bloc_observer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget
{
  final bool? isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getSciences()),
        BlocProvider(create: (BuildContext context) => AppCubit()..changeAppMode(
          fromShared: isDark,
        ),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state ) {},
        builder: (context, state )
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,
            home : BmiScreen(),
          );
        },
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/features/add-task/bloc/add_task_bloc.dart';
import 'package:task_management/features/completed-task/bloc/completed_task_bloc.dart';
import 'package:task_management/features/drawer/bloc/drawer_bloc.dart';
import 'package:task_management/features/edit-task/bloc/edit_task_bloc.dart';
import 'package:task_management/features/home/bloc/home_bloc.dart';
import 'package:task_management/features/home/presentation/home_page.dart';
import 'package:task_management/features/setting/bloc/setting_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<AddTaskBloc>(
          create: (context) => AddTaskBloc(),
        ),
        BlocProvider<CompletedTaskBloc>(
          create: (context) => CompletedTaskBloc(),
        ),
        BlocProvider<DrawerBloc>(
          create: (context) => DrawerBloc(),
        ),
        BlocProvider<EditTaskBloc>(
          create: (context) => EditTaskBloc(),
        ),
        BlocProvider<SettingBloc>(
          create: (context) => SettingBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

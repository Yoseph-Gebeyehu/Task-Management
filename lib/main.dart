import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/data/local/task_local_db.dart';
import 'package:task_management/data/repository/task_respository.dart';
import 'package:task_management/data/repository/impl/task_respositoryImpl.dart';
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TaskRepository>(
          create: (context) => TaskRepositoryImpl(
            taskLocalDB: TaskLocalDB(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              taskRepository: RepositoryProvider.of<TaskRepository>(context),
            ),
          ),
          BlocProvider<AddTaskBloc>(
            create: (context) => AddTaskBloc(
              addTaskRepository: RepositoryProvider.of<TaskRepository>(context),
            ),
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
      ),
    );
  }
}

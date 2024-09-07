import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/data/local/task_local_db.dart';
import 'package:task_management/data/repository/add_task_respository.dart';
import 'package:task_management/data/repository/get_task_repository.dart';
import 'package:task_management/data/repository/impl/add_task_respositoryImpl.dart';
import 'package:task_management/data/repository/impl/get_task_repositoryImpl.dart';
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
        RepositoryProvider<AddTaskRepository>(
          create: (context) => AddTaskRepositoryImpl(
            taskLocalDB: TaskLocalDB(),
          ),
        ),
        RepositoryProvider<GetTaskRepository>(
          create: (context) => GetTaskRepositoryimpl(
            taskLocalDB: TaskLocalDB(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              getTaskRepository:
                  RepositoryProvider.of<GetTaskRepository>(context),
            ),
          ),
          BlocProvider<AddTaskBloc>(
            create: (context) => AddTaskBloc(
              addTaskRepository:
                  RepositoryProvider.of<AddTaskRepository>(context),
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

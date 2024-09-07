import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/data/model/task.dart';
import 'package:task_management/domain/constant/app_images.dart';
import 'package:task_management/domain/custom_dialog.dart';
import 'package:task_management/features/add-task/presentation/add_task.dart';
import 'package:task_management/features/drawer/presentation/drawer.dart';
import 'package:task_management/features/edit-task/presentation/edit_task.dart';
import 'package:task_management/features/empty-task/presentation/empty_task.dart';
import 'package:task_management/features/home/bloc/home_bloc.dart';
import 'package:task_management/features/home/widget/performance_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Home'),
        elevation: 3,
        actions: [
          TextButton(
              onPressed: () async {
                CustomDialog.showConfirmation(
                  context: context,
                  title: 'Delete All',
                  desc: "Are you sure to delete all the tasks permanently?",
                  confirmText: 'Delete',
                  cancelBtnText: 'Cancel',
                  onConfirm: () {
                    BlocProvider.of<HomeBloc>(context).add(DeleteAllTasks());
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text(
                'Delete all',
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoaded) {
            final completedTasks =
                state.tasks.where((task) => task.isCompleted == 1);
            final tasks = state.tasks;
            double performance = tasks.isEmpty
                ? 0
                : (completedTasks.length * 100 / tasks.length);

            return tasks.isEmpty
                ? EmptyTask(
                    deviceSize: deviceSize,
                    imagePath: AppImages.emptyTodo,
                    title:
                        'You didn\'t add any tasks yet! Please add by clicking the \'Add Task\' button below!',
                  )
                : Column(
                    children: [
                      // Display quote if available
                      state.quote != null
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '"${state.quote.content}"',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[800],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '- ${state.quote.author}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blueGrey[600],
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: tasks[index].isCompleted == 1
                                    ? const Color.fromARGB(255, 198, 245, 199)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: tasks[index].isCompleted == 1
                                      ? Colors.green
                                      : const Color.fromARGB(
                                          255, 200, 192, 192),
                                ),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: tasks[index].isCompleted == 1
                                      ? Colors.green
                                      : Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<HomeBloc>(context).add(
                                        UpdateTaskStatus(
                                          oldTask: tasks[index],
                                          newTask: Task(
                                            id: tasks[index].id,
                                            title: tasks[index].title,
                                            description:
                                                tasks[index].description,
                                            startingTime:
                                                tasks[index].startingTime,
                                            endingTime: tasks[index].endingTime,
                                            isCompleted:
                                                tasks[index].isCompleted == 0
                                                    ? 1
                                                    : 0,
                                          ),
                                        ),
                                      );
                                      BlocProvider.of<HomeBloc>(context)
                                          .add(LoadTasks());
                                    },
                                    icon: Icon(
                                      Icons.check_circle_outline,
                                      color: tasks[index].isCompleted == 0
                                          ? const Color.fromARGB(
                                              255, 200, 192, 192)
                                          : Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(tasks[index].title),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(tasks[index].description),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(tasks[index].startingTime),
                                        const Text(' - '),
                                        Text(tasks[index].endingTime),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: SizedBox(
                                  width: deviceSize.width * 0.25,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.green),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditTaskPage(
                                                      task: tasks[index]),
                                            ),
                                          );
                                        },
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          CustomDialog.showConfirmation(
                                            context: context,
                                            title: 'Remove Task',
                                            desc:
                                                "Are you sure to delete the task permanently?",
                                            confirmText: 'Delete',
                                            cancelBtnText: 'Cancel',
                                            onConfirm: () {
                                              BlocProvider.of<HomeBloc>(context)
                                                  .add(DeleteTask(
                                                      task: tasks[index]));
                                              Navigator.pop(context);
                                            },
                                            onCancel: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      PerformanceIndicator(
                        deviceSize: deviceSize,
                        performance: performance,
                      ),
                    ],
                  );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'View Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Task',
            ),
          ],
          currentIndex: 0,
          onTap: (index) {
            if (index == 1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTaskPage(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

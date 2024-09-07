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

class HomePage extends StatelessWidget {
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController endingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Home'),
        actions: [
          TextButton(
              onPressed: () async {
                CustomDialog.showConfirmation(
                  context: context,
                  title: 'Delete All',
                  desc: "Are you sure to delete of the tasks permanently?",
                  confirmText: 'Delete',
                  cancelBtnText: 'Cancle',
                  onConfirm: () {
                    BlocProvider.of<HomeBloc>(context).add(
                      DeleteAllTasks(),
                    );
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    Navigator.of(context).pop();
                  },
                );
              },
              child: const Text(
                'Delete all',
                style: TextStyle(
                  color: Colors.red,
                ),
              ))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          BlocProvider.of<HomeBloc>(context).add(LoadTasks());
          if (state is HomeLoaded) {
            final completedTasks =
                state.tasks.where((task) => task.isCompleted == 1);
            final tasks = state.tasks;
            var performance = completedTasks.length * 100 / tasks.length;

            return tasks.isEmpty
                ? EmptyTask(
                    deviceSize: deviceSize,
                    imagePath: AppImages.emptyTodo,
                    title:
                        'You didn\'t add task yet! Please add by clicking the \'Add Task\' button below!',
                  )
                : Column(
                    children: [
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
                                                          task: tasks[index])));
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
                                            cancelBtnText: 'Cancle',
                                            onConfirm: () {
                                              BlocProvider.of<HomeBloc>(context)
                                                  .add(
                                                DeleteTask(task: tasks[index]),
                                              );
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
                      )
                    ],
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

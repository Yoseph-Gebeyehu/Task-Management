import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/domain/custom_dialog.dart';
// import 'package:task_management/domain/custom_dialog/add_task_screen.dart'; // Updated import
import 'package:task_management/features/add-task/presentation/add_task.dart';
import 'package:task_management/features/drawer/presentation/drawer.dart';
import 'package:task_management/features/empty-task/presentation/empty_task.dart';
import 'package:task_management/features/home/bloc/home_bloc.dart';

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
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          BlocProvider.of<HomeBloc>(context).add(LoadTasks());
          if (state is HomeLoaded) {
            final tasks = state.tasks;

            return tasks.isEmpty
                ? EmptyTask(deviceSize: deviceSize)
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 200, 192, 192),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.check_circle_outline,
                                color: Color.fromARGB(255, 200, 192, 192),
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
                                  onPressed: () {},
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
                                        BlocProvider.of<HomeBloc>(context).add(
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
                  builder: (context) => AddTaskPage(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/domain/constant/app_images.dart';
import 'package:task_management/features/completed-task/bloc/completed_task_bloc.dart';
import 'package:task_management/features/drawer/presentation/drawer.dart';
import 'package:task_management/features/empty-task/presentation/empty_task.dart';

class CompletedTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(child: DrawerPage()),
      appBar: AppBar(
        elevation: 3,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Completed tasks'),
      ),
      body: BlocConsumer<CompletedTaskBloc, CompletedTaskState>(
        listener: (context, state) {},
        builder: (context, state) {
          BlocProvider.of<CompletedTaskBloc>(context).add(LoadCompletedTasks());
          if (state is CompletedTasks) {
            final tasks =
                state.tasks.where((task) => task.isCompleted == 1).toList();

            return tasks.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: deviceSize.width * 0.05,
                    ),
                    child: EmptyTask(
                      deviceSize: deviceSize,
                      imagePath: AppImages.notCompleted,
                      title: "You haven\'t completed any tasks yet! ",
                    ),
                  )
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: tasks[index].isCompleted == 1
                              ? const Color.fromARGB(255, 198, 245, 199)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: tasks[index].isCompleted == 1
                                ? Colors.green
                                : const Color.fromARGB(255, 200, 192, 192),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: tasks[index].isCompleted == 1
                                ? Colors.green
                                : Colors.white,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.check_circle_outline,
                                color: tasks[index].isCompleted == 0
                                    ? const Color.fromARGB(255, 200, 192, 192)
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
                        ),
                      );
                    },
                  );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

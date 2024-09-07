import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management/data/model/task.dart';
import 'package:task_management/features/home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  Task? task;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Home'),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                  title: const Text("task.name"),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("task.taskDescription " ?? 'No description'),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text("9:00 am" ?? 'N/A'),
                          Text(' - '),
                          Text("9:00 am" ?? 'N/A'),
                        ],
                      ),
                    ],
                  ),
                  trailing: SizedBox(
                    width: deviceSize.width * 0.25,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

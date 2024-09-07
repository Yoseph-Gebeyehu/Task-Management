// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:task_management/domain/constant/app_images.dart';
import 'package:task_management/features/completed-task/presentation/completed_task.dart';
import 'package:task_management/features/home/presentation/home_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: deviceSize.height * 0.35,
            width: deviceSize.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
            ),
            child: Image.asset(
              AppImages.todo,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: deviceSize.height * 0.01),
          Divider(
            endIndent: deviceSize.width * 0.05,
            indent: deviceSize.width * 0.05,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Home'),
            ),
          ),
          Divider(
            endIndent: deviceSize.width * 0.05,
            indent: deviceSize.width * 0.05,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CompletedTaskPage()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.done,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Completed Tasks'),
            ),
          ),
          Divider(
            endIndent: deviceSize.width * 0.05,
            indent: deviceSize.width * 0.05,
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
              title: const Text('Settings'),
            ),
          ),
          Divider(
            endIndent: deviceSize.width * 0.05,
            indent: deviceSize.width * 0.05,
          ),
        ],
      ),
    );
  }
}

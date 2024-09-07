import 'package:flutter/material.dart';
import 'package:task_management/domain/constant/app_images.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({Key? key, required this.deviceSize}) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.emptyTodo),
        Text(
          'You didn\'t add task yet! Please add by clicking the \'Add Task\' button below!',
          style: TextStyle(fontSize: deviceSize.width * 0.05),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

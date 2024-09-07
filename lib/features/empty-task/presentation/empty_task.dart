import 'package:flutter/material.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({
    Key? key,
    required this.deviceSize,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  final Size deviceSize;
  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(
          height: deviceSize.height * 0.02,
        ),
        Text(
          title,
          style: TextStyle(fontSize: deviceSize.width * 0.05),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PerformanceIndicator extends StatelessWidget {
  const PerformanceIndicator({
    Key? key,
    required this.deviceSize,
    required this.performance,
  }) : super(key: key);

  final Size deviceSize;
  final double performance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      width: deviceSize.width,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color.fromARGB(255, 218, 212, 212)),
          left: BorderSide(color: Color.fromARGB(255, 218, 212, 212)),
          right: BorderSide(color: Color.fromARGB(255, 218, 212, 212)),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'You did ',
              style: TextStyle(
                color: Colors.black,
                fontSize: deviceSize.width * 0.04,
              ),
            ),
            TextSpan(
              text: '${performance.toStringAsFixed(1)}%',
              style: TextStyle(
                color: performance >= 75
                    ? Colors.green
                    : performance >= 50
                        ? Colors.blue
                        : Colors.red,
                fontSize: deviceSize.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' of the tasks',
              style: TextStyle(
                color: Colors.black,
                fontSize: deviceSize.width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isUpdate;
  final String? hintText;
  final String? fromOrTo;

  const CustomDatePicker({
    Key? key,
    required this.controller,
    this.onTap,
    required this.isUpdate,
    this.hintText,
    required this.fromOrTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: const Color.fromARGB(255, 230, 225, 225),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                controller.text.isEmpty
                    ? hintText ?? 'Select time'
                    : '$fromOrTo - ${controller.text}',
                style: TextStyle(
                  color:
                      controller.text.isNotEmpty ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: deviceSize.width * 0.036,
                ),
              ),
            ),
            const SizedBox(width: 8), // Add spacing between text and icon
            Icon(
              Icons
                  .access_time, // Changed to access_time to match time selection
              color: theme.primaryColor,
              size: deviceSize.width * 0.04, // Adjust icon size
            ),
          ],
        ),
      ),
    );
  }
}

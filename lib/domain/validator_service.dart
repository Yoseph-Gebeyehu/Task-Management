import 'package:flutter/material.dart';

class FormValidatorService {
  static String? validateTaskTitle(String value, BuildContext context) {
    if (value.isEmpty) {
      return 'Task title is empty';
    }
    return null;
  }

  static String? validateTaskDescription(String value, BuildContext context) {
    if (value.isEmpty) {
      return 'Task description is empty';
    }
    return null;
  }

  static String? validateTaskDate(String value, BuildContext context) {
    if (value.isEmpty) {
      return 'Task date is empty';
    }
    return null;
  }

  static validateOptional(BuildContext context) {
    return null;
  }
}

import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffix;

  const CustomTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return TextFormField(
      validator: validator,
      controller: controller, // Ensure the controller is passed correctly
      cursorColor: Colors.green,
      cursorWidth: 1,
      decoration: InputDecoration(
        suffixIcon: suffix,
        contentPadding: EdgeInsets.only(left: deviceSize.width * 0.05),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: deviceSize.width * 0.032,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.green),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}

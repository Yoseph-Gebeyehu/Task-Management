import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  String hintText;
  String? Function(String?)? validator;
  bool? readOnly;
  Widget? suffix;

  CustomTextForm({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.readOnly,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return TextFormField(
      readOnly: readOnly ?? false,
      validator: validator,
      maxLines: null,
      minLines: 1,
      // expands: true,
      // minLines: null,
      // maxLines: null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
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
          // borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          // borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

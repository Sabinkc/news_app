import 'package:flutter/material.dart';
import 'package:news_app/common/colors.dart';

class CommonTextfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData suffixIcon;

  bool isObscure;
  TextEditingController? controller;
  Function(String)? onChanged;
  Function()? onSuffixIconPressed;
  CommonTextfield(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.suffixIcon,
      required this.isObscure,
      this.controller,
      this.onChanged,
      this.onSuffixIconPressed});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isObscure,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CommonColor.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CommonColor.primaryColor)),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 22, color: CommonColor.primaryColor),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: IconButton(
            onPressed: onSuffixIconPressed,
            icon: Icon(suffixIcon, size: 18, color: CommonColor.primaryColor)),
      ),
    );
  }
}

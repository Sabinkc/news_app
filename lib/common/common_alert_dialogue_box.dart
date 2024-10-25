import 'package:flutter/material.dart';

class CommonAlertDialogueBox extends StatelessWidget {
  String title;
  CommonAlertDialogueBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: AlertDialog(
        title: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    ));
  }
}

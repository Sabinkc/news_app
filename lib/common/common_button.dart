import 'package:flutter/material.dart';
import 'package:news_app/common/colors.dart';

class CommonButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonName;
  final double horizontalPadding;
  final double verticalPadding;
  const CommonButton(
      {super.key,
      required this.onPressed,
      required this.buttonName,
      required this.horizontalPadding,
      required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: CommonColor.primaryColor,
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding)),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

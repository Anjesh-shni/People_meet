import 'package:flutter/material.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/small_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color;
  const CustomButton(
      {super.key, required this.text, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 50),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: buttonColor),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        onPressed: onPressed,
        child: SmallText(
          text: text,
          size: 15,
          color: whiteColor,
        ),
      ),
    );
  }
}

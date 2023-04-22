import 'package:flutter/material.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/big_text.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color1,
      
      content: BigText(
        text: text,
        size: 15,
        color: whiteColor,
      ),
    ),
  );
}

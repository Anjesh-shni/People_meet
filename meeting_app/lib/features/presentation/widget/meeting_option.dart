import 'package:flutter/material.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/small_text.dart';

class MeetingOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOption(
      {super.key,
      required this.text,
      required this.isMute,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmallText(
            text: text,
            size: 15,
            color: whiteColor,
          ),
          Switch.adaptive(
            value: isMute,
            onChanged: onChanged,
            activeColor: green,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/big_text.dart';

class CustomHomeButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const CustomHomeButton(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    offset: const Offset(0, 0.4),
                    blurRadius: 10,
                  ),
                ]),
            child: Center(
              child: Icon(icon),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        BigText(text: text),
      ],
    );
  }
}

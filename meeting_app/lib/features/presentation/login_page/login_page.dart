import 'package:flutter/material.dart';
import 'package:meeting_app/features/data_resource/auth_method.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/big_text.dart';
import 'package:meeting_app/global/reusable_widget/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthMethod _authMethod = AuthMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigText(
            text: "Start or Join a Meeting",
            size: 25,
            color: whiteColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38),
            child: Image.asset("assets/onboarding.jpg"),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomButton(
            text: "Google Sign In",
            color: buttonColor,
            onPressed: () async {
              bool res = await _authMethod.signInWithGoogle(context);
              if (res) {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/home');
              }
            },
          ),
        ],
      ),
    );
  }
}

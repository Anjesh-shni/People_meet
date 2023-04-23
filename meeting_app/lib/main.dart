import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/features/data_resource/auth_method.dart';
import 'package:meeting_app/features/presentation/login_page/login_page.dart';
import 'package:meeting_app/features/presentation/screens/home_page.dart';
import 'package:meeting_app/features/presentation/screens/pages/video_call_meeting.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/big_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("=======APP STARTED=======");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arcane Meet',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/video-call': (context) => const VideoCallMeeting(),
      },
      home: StreamBuilder(
        stream: AuthMethod().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: BigText(
                text: "You need to logIn first to join or Host Meeting",
                size: 25,
                color: whiteColor,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: green,
              ),
            );
          }
          if (snapshot.hasData) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}

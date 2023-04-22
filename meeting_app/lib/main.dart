import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meeting_app/features/presentation/login_page/login_page.dart';
import 'package:meeting_app/features/presentation/screens/home_page.dart';
import 'package:meeting_app/global/constant/colors.dart';

void main() async{
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
      title: 'Arcane',
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
      home: const LoginPage(),
    );
  }
}

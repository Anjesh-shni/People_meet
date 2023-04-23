import 'package:flutter/material.dart';
import 'package:meeting_app/features/data_resource/auth_method.dart';
import 'package:meeting_app/features/presentation/screens/pages/history_meeting.dart';
import 'package:meeting_app/features/presentation/screens/pages/meeting_screen.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/big_text.dart';
import 'package:meeting_app/global/reusable_widget/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthMethod _authMethod = AuthMethod();
  int _currentIndex = 0;
  onPageChanged(int pageItem) {
    setState(() {
      _currentIndex = pageItem;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    Container(),
    CustomButton(
      text: "Log Out",
      color: secondaryBackgroundColor,
      onPressed: () => AuthMethod().signOut(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(
          text: "Meet & Chat",
          size: 22,
          color: whiteColor,
        ),
      ),
      body: pages[_currentIndex],
      drawer: Drawer(
        backgroundColor: Colors.grey.withOpacity(0.3),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: green,
        unselectedItemColor: lightGrey,
        onTap: onPageChanged,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            label: "Meet & Chat",
            icon: Icon(
              Icons.comment_bank,
            ),
          ),
          BottomNavigationBarItem(
            label: "Meetings",
            icon: Icon(
              Icons.lock_clock,
            ),
          ),
          BottomNavigationBarItem(
            label: "Contacts",
            icon: Icon(
              Icons.person_outline,
            ),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

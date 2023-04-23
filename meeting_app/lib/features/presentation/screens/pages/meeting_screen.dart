import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meeting_app/features/data_resource/jtsi_meeting_method.dart';

import '../../../../global/reusable_widget/big_text.dart';
import '../../widget/custom_home_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  //new meeting method
  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();

    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  //join Meeting
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, "/video-call");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomHomeButton(
                icon: Icons.videocam,
                onTap: createNewMeeting,
                text: 'New Meeting',
              ),
              CustomHomeButton(
                icon: Icons.person,
                onTap: () => joinMeeting(context),
                text: 'Join Meeting',
              ),
              CustomHomeButton(
                icon: Icons.calendar_today_rounded,
                onTap: () {},
                text: 'Schedule',
              ),
              CustomHomeButton(
                icon: Icons.arrow_upward_rounded,
                onTap: () {},
                text: 'Share screen',
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: BigText(
                text: "Create/Join meeting in a single click!",
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

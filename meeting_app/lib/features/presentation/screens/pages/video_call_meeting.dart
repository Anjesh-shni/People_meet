import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meeting_app/features/data_resource/auth_method.dart';
import 'package:meeting_app/features/data_resource/jtsi_meeting_method.dart';
import 'package:meeting_app/features/presentation/widget/meeting_option.dart';

import '../../../../global/constant/colors.dart';
import '../../../../global/reusable_widget/big_text.dart';

class VideoCallMeeting extends StatefulWidget {
  const VideoCallMeeting({super.key});

  @override
  State<VideoCallMeeting> createState() => _VideoCallMeetingState();
}

class _VideoCallMeetingState extends State<VideoCallMeeting> {
  final AuthMethod _authMethod = AuthMethod();
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMute = true;
  bool isVideoMute = true;

  @override
  void initState() {
    super.initState();
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethod.user.displayName);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    meetingIdController.dispose();
    JitsiMeet.removeAllListeners();
  }

  //join function
  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMute,
      isVideoMuted: isVideoMute,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: BigText(
          text: "Join meeting",
          size: 22,
          color: whiteColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: meetingIdController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                border: InputBorder.none,
                hintText: "Room ID",
                filled: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              maxLines: 1,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                border: InputBorder.none,
                hintText: "Name",
                filled: true,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: _joinMeeting,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: BigText(text: "Join"),
              ),
            ),
            const SizedBox(height: 40),
            MeetingOption(
              text: "Mute Audio",
              isMute: isAudioMute,
              onChanged: onAudioMuted,
            ),
            const SizedBox(height: 10),
            MeetingOption(
              text: "Turn off video",
              isMute: isVideoMute,
              onChanged: onVideoMuted,
            ),
          ],
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMute = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMute = val;
    });
  }
}

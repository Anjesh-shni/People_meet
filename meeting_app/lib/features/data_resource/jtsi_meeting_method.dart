import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meeting_app/features/data_resource/auth_method.dart';
import 'package:meeting_app/features/data_resource/firestrore_method.dart';

class JitsiMeetMethods {
  final FirestoreMethod _firestoreMethod = FirestoreMethod();
  final AuthMethod _authMethod = AuthMethod();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username.isEmpty) {
        name = _authMethod.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethod.user.email
        ..userAvatarURL = _authMethod.user.photoURL
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreMethod.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      SnackBar(
        content: Text(error.toString()),
      );
    }
  }
}

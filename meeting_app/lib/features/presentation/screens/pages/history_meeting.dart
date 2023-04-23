import 'package:flutter/material.dart';
import 'package:meeting_app/global/constant/colors.dart';
import 'package:meeting_app/global/reusable_widget/small_text.dart';
import '../../../data_resource/firestrore_method.dart';
import 'package:intl/intl.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethod().meetingHistory,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: green,
              ),
            );
          }
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: secondaryBackgroundColor,
              child: ListTile(
                title: SmallText(
                  text:
                      "Room Nam : ${(snapshot.data! as dynamic).docs[index]['meetingName']}",
                  size: 14,
                  color: whiteColor,
                ),
                subtitle: SmallText(
                  text:
                      "Joined on : ${DateFormat.yMMMd().format((snapshot.data!).docs[index]['createdAt'].toDate())}",
                  size: 14,
                  color: whiteColor,
                ),
              ),
            ),
          );
        });
  }
}

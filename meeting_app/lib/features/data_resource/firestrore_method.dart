import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreMethod {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingHistory =>
      _firebaseFirestore
          .collection("user")
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .snapshots();

  addToMeetingHistory(String meetingName) async {
    try {
      await _firebaseFirestore
          .collection("user")
          .doc(_auth.currentUser!.uid)
          .collection("meetings")
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
  }
}

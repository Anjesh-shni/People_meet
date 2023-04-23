import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meeting_app/global/reusable_widget/snack_bar.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//To track user
  Stream<User?> get authChanges => _auth.authStateChanges();

  User get user=> _auth.currentUser!;

  //SignIn function
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool res = false;

    try {
      final GoogleSignInAccount? google = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await google?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection("user").doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      res = false;
    }
    return res;
  }

  void signOut(){
    try{
      _auth.signOut();
    }catch(e){
      SnackBar(content: Text(e.toString()),);
    }
  }
}

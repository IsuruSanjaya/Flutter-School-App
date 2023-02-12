import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_3/controllers/scaffold_messenger_controller.dart';

import '../views/home/home.dart';

class AuthContonller {
  final firebase = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final ScaffoldMessageController scaffoldMessageController =
      ScaffoldMessageController();

  //sign in with email and password

  Future<void> signWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      navigateToHome(context);
    } catch (e) {
      debugPrint("Sign in failed ");

      scaffoldMessageController.showSnackBar(
          "sign in failed , Please try again", context);

      return;
    }
  }

  //register with email and password
  Future<void> registerWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (auth.currentUser != null) {
        await firebase
            .collection("users")
            .doc()
            .set({"uid": auth.currentUser!.uid, "name": name});
        navigateToHome(context);
      }
    } catch (e) {
      debugPrint("Register failed $e");
      scaffoldMessageController.showSnackBar(
          "Register failed, Please try again", context);
      return;
    }
  }

  void navigateToHome(BuildContext context) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const Home()));
}

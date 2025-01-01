import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> firebaseRequest() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    log("Firebase Connectivity Successful!!!!");
  }).catchError((e) {
    log("Firebase Connectivity Error : $e");
  });
}


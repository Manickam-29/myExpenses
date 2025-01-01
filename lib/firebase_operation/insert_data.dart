import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class InsertData {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  insertNewExpense(String date) async {
    Map<String, dynamic> newData = {};

    await firestore.collection('userInfo').doc('').set(newData).then((onValue) {
      log('New Data added $newData}');
    }).catchError((e) {
      log("Error Occurred : $e");
    });
  }
}

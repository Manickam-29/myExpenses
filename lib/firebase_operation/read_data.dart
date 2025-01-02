
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadData {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> readExpenseByDate(String date) async {
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('expenses').doc(date).get();
    return documentSnapshot;
  }
}

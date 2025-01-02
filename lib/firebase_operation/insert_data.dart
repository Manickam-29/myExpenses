import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myexpenses/firebase_operation/read_data.dart';

class InsertData {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future insertNewExpense(Map<String, dynamic> data, String date) async {

    DocumentSnapshot existDoc = await ReadData().readExpenseByDate(date);
    List<dynamic> expensesList = [];

    if(existDoc.exists){
      expensesList = existDoc['expenseList'];
    }

    expensesList.add(data);
    await firestore.collection('expenses').doc(date).set({
      'expenseList': expensesList,
    });
  }

  Future updateExpenseList(String date, List<dynamic> expenseList) async {
    await firestore.collection('expenses').doc(date).set({
      'expenseList': expenseList,
    });
  }
}
